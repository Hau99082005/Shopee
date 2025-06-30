<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\carts;
use App\Models\OrderItems;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        return Order::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $order = Order::with('orderItems.product')->findOrFail($id);
        return view('orders.show', compact('order'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    // Hiển thị trang checkout
    public function showCheckout()
    {
        $user = Auth::user();
        $cartList = carts::with('product')->where('user_id', $user->id)->get();
        $categories = \DB::table('categories')->get();
        return view('checkout', compact('cartList', 'categories'));
    }

    // Xử lý đặt hàng
    public function processCheckout(Request $request)
    {
        $user = Auth::user();
        $cartList = carts::with('product')->where('user_id', $user->id)->get();
        if ($cartList->isEmpty()) {
            return redirect()->route('cart')->with('error', 'Giỏ hàng trống!');
        }
        DB::beginTransaction();
        try {
            $paymentMethod = $request->payment_method ?? 'cod';
            // Tạo đơn hàng
            $order = Order::create([
                'user_id' => $user->id,
                'total_price' => $cartList->sum(fn($c) => $c->product->price * $c->quantity),
                'status' => $paymentMethod === 'cod' ? 'pending' : 'unpaid',
                'shipping_address' => $request->shipping_name . ' | ' . $request->shipping_phone . ' | ' . $request->shipping_address,
            ]);
            // Tạo chi tiết đơn hàng và trừ tồn kho
            foreach ($cartList as $cart) {
                OrderItems::create([
                    'order_id' => $order->id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'price' => $cart->product->price,
                ]);
                // Trừ tồn kho
                if ($cart->product) {
                    $cart->product->decrement('stock', $cart->quantity);
                }
            }
            // Xóa giỏ hàng
            carts::where('user_id', $user->id)->delete();
            DB::commit();
            return redirect()->route('orders.show', $order->id)->with('success', 'Đặt hàng thành công!');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Có lỗi xảy ra khi đặt hàng!<br>' . $e->getMessage());
        }
    }
}