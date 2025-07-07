<?php

namespace App\Http\Controllers;

use App\Models\User; // Import model User để truy vấn dữ liệu người dùng
use Illuminate\Http\Request;

class AdminCustomerController extends Controller
{
    // Hàm hiển thị danh sách khách hàng cho admin
    public function index()
    {
        // Lấy tất cả user cùng số lượng đơn hàng của từng user
        // withCount('orders') sẽ thêm thuộc tính orders_count cho mỗi user
        $customers = User::withCount('orders')->get();

        // Trả về view 'admin.customers.index' và truyền biến $customers sang view
        return view('admin.customers.index', compact('customers'));
    }
} 