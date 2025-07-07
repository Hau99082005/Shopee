<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;

class AdminOrderController extends Controller
{
    // Hiển thị danh sách tất cả đơn hàng cho admin
    public function index() {
        // Lấy tất cả đơn hàng, sắp xếp mới nhất lên đầu
        $orders = Order::orderByDesc('created_at')->get();
        // Trả về view danh sách đơn hàng, truyền biến $orders
        return view('admin.orders.index', compact('orders'));
    }

    // Xoá đơn hàng (chỉ admin mới được phép)
    public function destroy($id) {
        $order = Order::findOrFail($id);
        $order->delete();
        // Sau khi xoá, quay lại trang danh sách với thông báo
        return redirect()->route('admin-orders.index')->with('success', 'Đã xoá đơn hàng thành công!');
    }
} 