@extends('layouts.app')
@section('content')
<style>
    body {
        background: linear-gradient(120deg, #fff 60%, #ffe0b2 100%);
    }
    .order-list-container {
        max-width: 900px;
        margin: 48px auto 0 auto;
        background: rgba(255,255,255,0.98);
        border-radius: 32px;
        box-shadow: 0 8px 40px rgba(255,87,34,0.13), 0 2px 8px rgba(0,0,0,0.06);
        padding: 48px 32px 32px 32px;
    }
    .order-list-title {
        font-size: 2.3rem;
        font-weight: 800;
        background: linear-gradient(90deg, #ff9800 0%, #ff5722 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 32px;
        text-align: center;
        letter-spacing: 1px;
    }
    .order-table th {
        background: linear-gradient(90deg, #ff9800 0%, #ff5722 100%);
        color: #fff;
        text-align: center;
        font-weight: 700;
        font-size: 1.1rem;
        border-top-left-radius: 16px;
        border-top-right-radius: 16px;
    }
    .order-table td {
        text-align: center;
        vertical-align: middle;
        font-size: 1.05rem;
        background: #fff7f0;
        border-bottom: 1.5px solid #ffe0b2;
    }
    .order-table tr:last-child td {
        border-bottom: none;
    }
    .order-status {
        font-weight: 700;
        border-radius: 16px;
        padding: 6px 20px;
        font-size: 1.05rem;
        display: inline-block;
        box-shadow: 0 2px 8px rgba(255,152,0,0.08);
        letter-spacing: 0.5px;
    }
    .order-status.pending { background: #fff3cd; color: #ff9800; border: 1.5px solid #ff9800; }
    .order-status.paid { background: #e0ffe6; color: #43b581; border: 1.5px solid #43b581; }
    .order-status.shipped { background: #e3f0ff; color: #007bff; border: 1.5px solid #007bff; }
    .order-status.cancelled { background: #ffe0e0; color: #dc3545; border: 1.5px solid #dc3545; }
    .order-detail-btn {
        background: linear-gradient(90deg, #ff9800 0%, #ff5722 100%);
        color: #fff;
        border: none;
        border-radius: 32px;
        padding: 12px 32px;
        font-weight: 700;
        font-size: 1.08rem;
        transition: background 0.2s, transform 0.1s;
        text-decoration: none;
        box-shadow: 0 2px 12px rgba(255,152,0,0.10);
        letter-spacing: 0.5px;
    }
    .order-detail-btn:hover {
        background: linear-gradient(90deg, #ff5722 0%, #ff9800 100%);
        transform: translateY(-2px) scale(1.04);
    }
    .order-table .text-danger {
        color: #ff5722 !important;
        font-size: 1.15rem;
        font-weight: 800;
    }
    @media (max-width: 700px) {
        .order-list-container { padding: 18px 2px 12px 2px; }
        .order-list-title { font-size: 1.3rem; }
        .order-table th, .order-table td { font-size: 0.95rem; padding: 8px 2px; }
        .order-detail-btn { padding: 8px 12px; font-size: 0.95rem; }
    }
</style>
<div class="order-list-container">
    <div class="order-list-title">Đơn hàng của tôi</div>
    <div class="table-responsive">
        <table class="table table-bordered order-table">
            <thead>
                <tr>
                    <th style="border-top-left-radius: 16px;">Mã đơn</th>
                    <th>Ngày đặt</th>
                    <th>Trạng thái</th>
                    <th>Tổng tiền</th>
                    <th style="border-top-right-radius: 16px;">Hành động</th>
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