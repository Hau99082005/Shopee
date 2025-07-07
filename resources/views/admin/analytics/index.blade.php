@extends('admin.admin')
@section('title', 'Analytics')
@push('styles')
<style>
    /* Bảng analytics: bo góc, bóng đổ, màu cam Shopee nhẹ */
    .analytics-container {
        margin-top: 32px;
        display: flex;
        flex-wrap: wrap;
        gap: 32px;
    }
    .analytics-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(255,87,34,0.08);
        padding: 32px 28px 24px 28px;
        min-width: 260px;
        flex: 1 1 260px;
        text-align: center;
    }
    .analytics-title {
        font-size: 1.2rem;
        font-weight: 700;
        color: #ff5722;
        margin-bottom: 18px;
        letter-spacing: 0.5px;
    }
    .analytics-value {
        font-size: 2.1rem;
        font-weight: 800;
        color: #ff9800;
        margin-bottom: 8px;
    }
    .analytics-label {
        font-size: 1rem;
        color: #888;
        margin-bottom: 6px;
    }
    .status-list {
        margin-top: 18px;
        text-align: left;
    }
    .status-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 8px;
        font-size: 1rem;
    }
    .status-badge {
        border-radius: 8px;
        padding: 2px 12px;
        font-weight: 600;
        font-size: 0.98rem;
        color: #fff;
        margin-left: 8px;
    }
    .status-pending { background: #ff9800; }
    .status-paid { background: #43b581; }
    .status-shipped { background: #007bff; }
    .status-cancelled { background: #dc3545; }
    .chart-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(255,87,34,0.08);
        padding: 32px 28px 24px 28px;
        margin-top: 32px;
    }
</style>
@endpush
@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Analytics</h1>
    <div class="analytics-container">
        <!-- Card tổng số đơn hàng -->
        <div class="analytics-card">
            <div class="analytics-title">Tổng số đơn hàng</div>
            <div class="analytics-value">{{ $totalOrders }}</div>
            <div class="analytics-label">Đơn hàng</div>
        </div>
        <!-- Card tổng doanh thu -->
        <div class="analytics-card">
            <div class="analytics-title">Tổng doanh thu</div>
            <div class="analytics-value">₫{{ number_format($totalRevenue, 0, ',', '.') }}</div>
            <div class="analytics-label">Chỉ tính đơn đã thanh toán</div>
        </div>
        <!-- Card trạng thái đơn hàng -->
        <div class="analytics-card">
            <div class="analytics-title">Trạng thái đơn hàng</div>
            <div class="status-list">
                <!-- Hiển thị số lượng đơn theo từng trạng thái -->
                <div class="status-item">Pending <span class="status-badge status-pending">{{ $orderStatusCounts['pending'] }}</span></div>
                <div class="status-item">Paid <span class="status-badge status-paid">{{ $orderStatusCounts['paid'] }}</span></div>
                <div class="status-item">Shipped <span class="status-badge status-shipped">{{ $orderStatusCounts['shipped'] }}</span></div>
                <div class="status-item">Cancelled <span class="status-badge status-cancelled">{{ $orderStatusCounts['cancelled'] }}</span></div>
            </div>
        </div>
    </div>
    <!-- Biểu đồ trực quan -->
    <div class="row mt-4">
        <!-- Biểu đồ cột trạng thái đơn hàng -->
        <div class="col-md-6">
            <div class="chart-card">
                <div class="analytics-title">Biểu đồ trạng thái đơn hàng</div>
                <canvas id="orderStatusChart" height="220"></canvas>
            </div>
        </div>
        <!-- Biểu đồ đường doanh thu 7 ngày gần nhất -->
        <div class="col-md-6">
            <div class="chart-card">
                <div class="analytics-title">Doanh thu 7 ngày gần nhất</div>
                <canvas id="revenueChart" height="220"></canvas>
            </div>
        </div>
    </div>
</div>
<!-- Nhúng Chart.js từ CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
// Biểu đồ cột trạng thái đơn hàng
const ctxStatus = document.getElementById('orderStatusChart').getContext('2d');
const orderStatusChart = new Chart(ctxStatus, {
    type: 'bar',
    data: {
        labels: ['Pending', 'Paid', 'Shipped', 'Cancelled'],
        datasets: [{
            label: 'Số lượng',
            data: [
                {{ $orderStatusCounts['pending'] }},
                {{ $orderStatusCounts['paid'] }},
                {{ $orderStatusCounts['shipped'] }},
                {{ $orderStatusCounts['cancelled'] }}
            ],
            backgroundColor: [
                '#ff9800', '#43b581', '#007bff', '#dc3545'
            ],
            borderRadius: 8
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false },
            title: { display: false }
        },
        scales: {
            y: { beginAtZero: true, ticks: { stepSize: 1 } }
        }
    }
});

// Biểu đồ đường doanh thu 7 ngày gần nhất
// Dữ liệu sẽ được truyền từ controller (giả lập ở đây)
const revenueLabels = {!! json_encode($revenueLabels ?? []) !!}; // Mảng ngày
const revenueData = {!! json_encode($revenueData ?? []) !!}; // Mảng doanh thu từng ngày
const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
const revenueChart = new Chart(ctxRevenue, {
    type: 'line',
    data: {
        labels: revenueLabels,
        datasets: [{
            label: 'Doanh thu (₫)',
            data: revenueData,
            borderColor: '#ff9800',
            backgroundColor: 'rgba(255,152,0,0.10)',
            tension: 0.3,
            fill: true,
            pointRadius: 4,
            pointBackgroundColor: '#ff9800',
            pointBorderColor: '#fff',
            pointHoverRadius: 6
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false },
            title: { display: false }
        },
        scales: {
            y: { beginAtZero: true }
        }
    }
});
</script>
@endsection 