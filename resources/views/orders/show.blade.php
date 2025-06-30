@extends('layouts.app')

@section('title', 'Chi tiết đơn hàng - Shopee')

@section('content')
<div class="container-xl py-5">
    <div class="mb-4 d-flex align-items-center gap-2">
        <img src="{{ asset('assets/images/shopee_logo.png') }}" alt="Shopee Logo" style="height: 48px;">
        <span class="fs-2 fw-bold text-danger" style="font-family: 'Lato',sans-serif; letter-spacing:1px;">Shopee</span>
        <span class="fs-3 fw-bold text-dark ms-2" style="font-family: 'Lato',sans-serif;">Chi tiết đơn hàng</span>
    </div>
    <div class="card shadow-lg border-0 mb-4" style="border-radius:22px;">
        <div class="card-body p-4">
            <div class="row mb-3">
                <div class="col-md-6 mb-2">
                    <div class="fw-bold fs-5 mb-2">Mã đơn hàng: <span class="text-primary">#{{ $order->id }}</span></div>
                    <div>Ngày đặt: <span class="text-muted">{{ $order->created_at->format('d/m/Y H:i') }}</span></div>
                    <div>Trạng thái: <span class="badge bg-{{ $order->status == 'pending' ? 'warning' : ($order->status == 'paid' ? 'success' : 'secondary') }}">{{ ucfirst($order->status) }}</span></div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="fw-bold fs-5 mb-2">Địa chỉ nhận hàng</div>
                    <div class="text-muted">{{ $order->shipping_address }}</div>
                </div>
            </div>
            <hr>
            <div class="table-responsive mb-4">
                <table class="table align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th></th>
                            <th>Sản phẩm</th>
                            <th class="text-center">Đơn giá</th>
                            <th class="text-center">Số lượng</th>
                            <th class="text-center">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($order->orderItems as $item)
                        <tr>
                            <td style="width: 70px;">
                                <img src="{{ asset('assets/images/' . ($item->product->image ?? 'default.png')) }}" alt="{{ $item->product->name ?? '' }}" class="rounded-3 border shadow-sm" style="width: 54px; height: 54px; object-fit: cover;">
                            </td>
                            <td style="min-width: 180px;">
                                <div class="fw-semibold text-dark">{{ $item->product->name ?? '' }}</div>
                                <div class="text-muted small">Mã SP: {{ isset($item->product->id) ? strtoupper(substr(md5($item->product->id), 0, 8)) : '' }}</div>
                            </td>
                            <td class="text-center text-danger">₫{{ $item->price }}</td>
                            <td class="text-center">{{ $item->quantity }}</td>
                            <td class="text-center text-danger fw-bold">₫{{ $item->price * $item->quantity }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-end align-items-center">
                <div class="me-4 fs-5">Tổng tiền hàng:</div>
                <div class="fs-3 fw-bold text-danger">₫{{ $order->total_price }}</div>
            </div>
        </div>
    </div>
    <a href="/" class="btn btn-outline-danger rounded-pill px-4 fw-bold"><i class="fas fa-arrow-left me-2"></i>Quay về trang chủ</a>
</div>
@endsection 