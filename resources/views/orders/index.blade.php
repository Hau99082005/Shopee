@extends('layouts.app')
@section('content')
<style>
    body {
        background: #fff6e9;
    }
    .order-list-container {
        max-width: 900px;
        margin: 48px auto 0 auto;
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(255,87,34,0.08);
        padding: 36px 20px 24px 20px;
    }
    .order-list-title {
        font-size: 1.7rem;
        font-weight: 700;
        color: #ff5722;
        margin-bottom: 24px;
        text-align: center;
        letter-spacing: 0.5px;
    }
    .order-table th {
        background: #ff9800;
        color: #fff;
        text-align: center;
        font-weight: 600;
        font-size: 1rem;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    .order-table td {
        text-align: center;
        vertical-align: middle;
        font-size: 1rem;
        background: #fffaf3;
        border-bottom: 1px solid #ffe0b2;
    }
    .order-table tr:last-child td {
        border-bottom: none;
    }
    .order-status {
        font-weight: 600;
        border-radius: 12px;
        padding: 4px 16px;
        font-size: 0.98rem;
        display: inline-block;
        background: #fff3cd;
        color: #ff9800;
        border: 1px solid #ff9800;
    }
    .order-status.paid { background: #e0ffe6; color: #43b581; border: 1px solid #43b581; }
    .order-status.shipped { background: #e3f0ff; color: #007bff; border: 1px solid #007bff; }
    .order-status.cancelled { background: #ffe0e0; color: #dc3545; border: 1px solid #dc3545; }
    .order-detail-btn {
        background: #ff9800;
        color: #fff;
        border: none;
        border-radius: 18px;
        padding: 8px 22px;
        font-weight: 600;
        font-size: 1rem;
        transition: background 0.2s, transform 0.1s;
        text-decoration: none;
        box-shadow: 0 2px 8px rgba(255,152,0,0.08);
        letter-spacing: 0.3px;
    }
    .order-detail-btn:hover {
        background: #ff5722;
        transform: translateY(-2px) scale(1.03);
    }
    .order-table .text-danger {
        color: #ff5722 !important;
        font-size: 1.08rem;
        font-weight: 700;
    }
    @media (max-width: 700px) {
        .order-list-container { padding: 10px 2px 8px 2px; }
        .order-list-title { font-size: 1.1rem; }
        .order-table th, .order-table td { font-size: 0.92rem; padding: 6px 2px; }
        .order-detail-btn { padding: 6px 10px; font-size: 0.92rem; }
    }
</style>
<div class="order-list-container">
    <div class="order-list-title">Đơn hàng của tôi</div>
    <div class="table-responsive">
        <table class="table table-bordered order-table">
            <thead>
                <tr>
                    <th style="border-top-left-radius: 10px;">Mã đơn</th>
                    <th>Ngày đặt</th>
                    <th>Trạng thái</th>
                    <th>Tổng tiền</th>
                    <th style="border-top-right-radius: 10px;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                @forelse($orders as $order)
                <tr>
                    <td>#{{ $order->id }}</td>
                    <td>{{ $order->created_at->format('d/m/Y H:i') }}</td>
                    <td><span class="order-status {{ $order->status }}">{{ ucfirst($order->status) }}</span></td>
                    <td class="text-danger fw-bold">₫{{ $order->total_price }}</td>
                    <td>
                        <a href="{{ route('orders.show', $order->id) }}" class="order-detail-btn">Xem chi tiết</a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="5" class="text-center text-muted">Bạn chưa có đơn hàng nào.</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection 