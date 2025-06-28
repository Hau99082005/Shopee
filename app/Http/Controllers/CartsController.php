<?php

namespace App\Http\Controllers;

use App\Models\carts;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CartsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('cart');
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
        //
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

    /**
     * Add product to cart via AJAX
     */
    public function addToCart(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $userId = $request->user()->id ?? 1;
            $productId = $request->product_id;
            $quantity = $request->quantity;

            // Kiểm tra stock
            $product = Product::find($productId);
            if ($product->stock < $quantity) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho'
                ], 400);
            }

            // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
            $existingCart = carts::where('user_id', $userId)
                ->where('product_id', $productId)
                ->first();

            if ($existingCart) {
                $newQuantity = $existingCart->quantity + $quantity;
                if ($product->stock < $newQuantity) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Tổng số lượng vượt quá stock hiện có'
                    ], 400);
                }
                $existingCart->quantity = $newQuantity;
                $existingCart->save();
            } else {
                carts::create([
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                ]);
            }

            return response()->json([
                'success' => true,
                'message' => 'Sản phẩm đã được thêm vào giỏ hàng'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi thêm vào giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Lấy giỏ hàng của user với thông tin chi tiết
    public function apiIndex(Request $request) {
        try {
            $userId = $request->user()->id ?? 1;
            
            // Lấy cart items với thông tin sản phẩm
            $cartItems = carts::where('user_id', $userId)
                ->with('product')
                ->get()
                ->groupBy('product_id')
                ->map(function ($items) {
                    $totalQuantity = $items->sum('quantity');
                    $firstItem = $items->first();
                    $product = $firstItem->product;
                    
                    if (!$product) {
                        return null; // Bỏ qua nếu sản phẩm không tồn tại
                    }
                    
                    $totalPrice = $product->getTotalPrice($totalQuantity);
                    
                    return [
                        'id' => $firstItem->id,
                        'user_id' => $firstItem->user_id,
                        'product_id' => $firstItem->product_id,
                        'quantity' => $totalQuantity,
                        'product' => [
                            'id' => $product->id,
                            'name' => $product->name,
                            'image' => $product->image,
                            'description' => $product->description,
                            'price' => (float) $product->price,
                            'formatted_price' => $product->formatted_price,
                            'stock' => $product->stock,
                            'seller_id' => $product->seller_id,
                            'category_id' => $product->category_id,
                            'created_at' => $product->created_at,
                            'updated_at' => $product->updated_at
                        ],
                        'total_price' => $totalPrice,
                        'formatted_total_price' => number_format($totalPrice, 0, ',', '.') . ' VNĐ',
                        'is_available' => $product->isInStock($totalQuantity),
                        'created_at' => $firstItem->created_at,
                        'updated_at' => $firstItem->updated_at
                    ];
                })
                ->filter() // Loại bỏ null values
                ->values();
            
            // Tính tổng tiền giỏ hàng
            $totalAmount = $cartItems->sum('total_price');
            $totalItems = $cartItems->count();
            $totalQuantity = $cartItems->sum('quantity');
            
            return response()->json([
                'success' => true,
                'data' => [
                    'items' => $cartItems,
                    'summary' => [
                        'total_items' => $totalItems,
                        'total_amount' => $totalAmount,
                        'formatted_total_amount' => number_format($totalAmount, 0, ',', '.') . ' VNĐ',
                        'total_quantity' => $totalQuantity,
                        'has_unavailable_items' => $cartItems->where('is_available', false)->count() > 0
                    ]
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi lấy giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Thêm sản phẩm vào giỏ hàng
    public function apiStore(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $userId = $request->user()->id ?? 1;
            $productId = $request->product_id;
            $quantity = $request->quantity;

            // Kiểm tra stock
            $product = Product::find($productId);
            if (!$product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sản phẩm không tồn tại'
                ], 404);
            }

            if (!$product->isInStock($quantity)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho (Còn lại: ' . $product->stock . ')'
                ], 400);
            }
            
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            $existingCart = carts::where('user_id', $userId)
                ->where('product_id', $productId)
                ->first();
                
            if ($existingCart) {
                $newQuantity = $existingCart->quantity + $quantity;
                if (!$product->isInStock($newQuantity)) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Tổng số lượng vượt quá stock hiện có (Còn lại: ' . $product->stock . ')'
                    ], 400);
                }
                // Nếu đã có, cập nhật quantity
                $existingCart->quantity = $newQuantity;
                $existingCart->save();
                $cart = $existingCart;
            } else {
                // Nếu chưa có, tạo mới
                $cart = carts::create([
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                ]);
            }
            
            // Trả về cart item với thông tin sản phẩm
            $cart->load('product');
            return response()->json([
                'success' => true,
                'message' => 'Sản phẩm đã được thêm vào giỏ hàng',
                'data' => [
                    'id' => $cart->id,
                    'user_id' => $cart->user_id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'product' => [
                        'id' => $cart->product->id,
                        'name' => $cart->product->name,
                        'price' => (float) $cart->product->price,
                        'formatted_price' => $cart->product->formatted_price,
                        'stock' => $cart->product->stock
                    ],
                    'total_price' => $cart->product->getTotalPrice($cart->quantity),
                    'created_at' => $cart->created_at,
                    'updated_at' => $cart->updated_at
                ]
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi thêm vào giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Cập nhật số lượng sản phẩm trong giỏ hàng
    public function apiUpdate(Request $request, $id) {
        try {
            $validator = Validator::make($request->all(), [
                'quantity' => 'required|integer|min:1',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $cart = carts::findOrFail($id);
            $quantity = $request->quantity;

            // Kiểm tra stock
            $product = $cart->product;
            if (!$product->isInStock($quantity)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho (Còn lại: ' . $product->stock . ')'
                ], 400);
            }

            $cart->quantity = $quantity;
            $cart->save();
            
            $cart->load('product');
            return response()->json([
                'success' => true,
                'message' => 'Cập nhật số lượng thành công',
                'data' => [
                    'id' => $cart->id,
                    'user_id' => $cart->user_id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'product' => [
                        'id' => $cart->product->id,
                        'name' => $cart->product->name,
                        'price' => (float) $cart->product->price,
                        'formatted_price' => $cart->product->formatted_price,
                        'stock' => $cart->product->stock
                    ],
                    'total_price' => $cart->product->getTotalPrice($cart->quantity),
                    'created_at' => $cart->created_at,
                    'updated_at' => $cart->updated_at
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi cập nhật giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Xóa sản phẩm khỏi giỏ hàng
    public function apiDestroy($id) {
        try {
            $cart = carts::findOrFail($id);
            $cart->delete();
            
            return response()->json([
                'success' => true,
                'message' => 'Đã xóa sản phẩm khỏi giỏ hàng'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xóa sản phẩm',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Dọn dẹp giỏ hàng - gộp các sản phẩm trùng lặp
    public function apiCleanup(Request $request) {
        try {
            $userId = $request->user()->id ?? 1;
            
            DB::beginTransaction();
            
            // Lấy tất cả cart items của user
            $cartItems = carts::where('user_id', $userId)->get();
            
            // Nhóm theo product_id
            $groupedItems = $cartItems->groupBy('product_id');
            $cleanedCount = 0;
            
            foreach ($groupedItems as $productId => $items) {
                if ($items->count() > 1) {
                    // Tính tổng quantity
                    $totalQuantity = $items->sum('quantity');
                    
                    // Kiểm tra stock
                    $product = Product::find($productId);
                    if ($product && $product->stock < $totalQuantity) {
                        $totalQuantity = $product->stock;
                    }
                    
                    // Giữ lại item đầu tiên và cập nhật quantity
                    $firstItem = $items->first();
                    $firstItem->quantity = $totalQuantity;
                    $firstItem->save();
                    
                    // Xóa các item còn lại
                    $items->skip(1)->each(function ($item) {
                        $item->delete();
                    });
                    
                    $cleanedCount += $items->count() - 1;
                }
            }
            
            DB::commit();
            
            return response()->json([
                'success' => true,
                'message' => "Đã dọn dẹp giỏ hàng thành công. Xóa {$cleanedCount} mục trùng lặp.",
                'data' => $this->apiIndex($request)->getData()
            ]);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi dọn dẹp giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Xóa toàn bộ giỏ hàng
    public function apiClear(Request $request) {
        try {
            $userId = $request->user()->id ?? 1;
            
            $deletedCount = carts::where('user_id', $userId)->delete();
            
            return response()->json([
                'success' => true,
                'message' => "Đã xóa toàn bộ giỏ hàng ({$deletedCount} mục)"
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xóa giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}