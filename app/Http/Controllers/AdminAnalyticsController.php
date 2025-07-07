<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class AdminAnalyticsController extends Controller
{
    // Hàm hiển thị trang Analytics cho admin
    public function index()
    {
        // Lấy tổng số đơn hàng
        $totalOrders = Order::count();
        // Lấy tổng doanh thu (chỉ tính các đơn đã thanh toán)
        $totalRevenue = Order::where('status', 'paid')->sum('total_price');
        // Lấy số lượng đơn hàng theo từng trạng thái
        $orderStatusCounts = [
            'pending' => Order::where('status', 'pending')->count(),
            'paid' => Order::where('status', 'paid')->count(),
            'shipped' => Order::where('status', 'shipped')->count(),
            'cancelled' => Order::where('status', 'cancelled')->count(),
        ];
        // Lấy doanh thu 7 ngày gần nhất (mỗi ngày 1 giá trị)
        $revenueLabels = [];
        $revenueData = [];
        for ($i = 6; $i >= 0; $i--) {
            // Tính ngày
            $date = now()->subDays($i)->format('d/m');
            $revenueLabels[] = $date;
            // Tổng doanh thu của ngày đó (chỉ đơn đã thanh toán)
            $total = Order::where('status', 'paid')
                ->whereDate('created_at', now()->subDays($i)->toDateString())
                ->sum('total_price');
            $revenueData[] = $total;
        }
        // Trả về view analytics và truyền các biến thống kê, dữ liệu biểu đồ
        return view('admin.analytics.index', compact('totalOrders', 'totalRevenue', 'orderStatusCounts', 'revenueLabels', 'revenueData'));
    }
} 