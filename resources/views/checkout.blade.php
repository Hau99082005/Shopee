@extends('layouts.app')

@section('title', 'Thanh toán - Shopee')

@section('content')
<div class="container-xl py-5">
    <div class="mb-4 d-flex align-items-center gap-2">
        <img src="{{ asset('assets/images/shopee_logo.png') }}" alt="Shopee Logo" style="height: 48px;">
        <span class="fs-2 fw-bold text-danger" style="font-family: 'Lato',sans-serif; letter-spacing:1px;">Thanh
            Toán</span>
    </div>
    <form action="{{ route('checkout.process') }}" method="POST" class="needs-validation" novalidate>
        @csrf
        <!-- Địa chỉ nhận hàng -->
        <div class="card shadow-lg mb-4 border-0 checkout-card"
            style="border-radius:22px; background: linear-gradient(90deg, #fff 70%, #fff0e6 100%);">
            <div class="card-body d-flex flex-column flex-md-row align-items-center gap-4 py-4 px-4">
                <div class="bg-danger bg-gradient rounded-circle d-flex align-items-center justify-content-center flex-shrink-0"
                    style="width:54px;height:54px;box-shadow:0 4px 16px #ee4d2d33;">
                    <i class="fas fa-map-marker-alt text-white fs-3"></i>
                </div>
                <div class="w-100">
                    <div class="fw-bold mb-2 fs-5 text-dark">Địa chỉ nhận hàng</div>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <div class="form-floating">
                                <input type="text" name="shipping_name" class="form-control rounded-3"
                                    id="shipping_name" value="{{ old('shipping_name', auth()->user()->name) }}"
                                    placeholder="Họ tên người nhận" required>
                                <label for="shipping_name"><i class="fas fa-user me-1"></i> Họ tên người nhận</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating">
                                <input type="text" name="shipping_phone" class="form-control rounded-3"
                                    id="shipping_phone" value="{{ old('shipping_phone', auth()->user()->phone) }}"
                                    placeholder="Số điện thoại" required>
                                <label for="shipping_phone"><i class="fas fa-phone me-1"></i> Số điện thoại</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating">
                                <input type="text" name="shipping_address" class="form-control rounded-3"
                                    id="shipping_address" value="{{ old('shipping_address', auth()->user()->address) }}"
                                    placeholder="Địa chỉ nhận hàng" required>
                                <label for="shipping_address"><i class="fas fa-home me-1"></i> Địa chỉ nhận hàng</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Danh sách sản phẩm -->
        <div class="card shadow-sm mb-4 border-0 checkout-card" style="border-radius:22px;">
            <div class="card-header bg-white fw-bold fs-5 border-0 px-4 py-3" style="border-radius:22px 22px 0 0;">
                Sản phẩm
            </div>
            <div class="card-body p-0"
                style="background:linear-gradient(90deg,#fff 80%,#fff7f2 100%); border-radius:0 0 22px 22px;">
                <div class="table-responsive">
                    <table class="table align-middle mb-0" style="border-radius:12px;overflow:hidden;">
                        <thead class="bg-light">
                            <tr style="font-size:1.08rem;">
                                <th></th>
                                <th>Sản phẩm</th>
                                <th class="text-center">Phân loại</th>
                                <th class="text-center">Đơn giá</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php $checkoutList = isset($cartList) ? $cartList : []; @endphp
                            @foreach ($checkoutList as $item)
                            <tr class="product-row" style="transition:background 0.2s;">
                                <td style="width: 80px;">
                                    <img src="{{ asset('assets/images/' . ($item->product->image ?? 'default.png')) }}"
                                        alt="{{ $item->product->name ?? '' }}" class="rounded-3 border shadow-sm"
                                        style="width: 60px; height: 60px; object-fit: cover;">
                                </td>
                                <td style="min-width: 180px;">
                                    <div class="fw-semibold text-dark" style="font-size:1.08rem;">
                                        {{ $item->product->name ?? '' }}</div>
                                    <div class="text-muted small">Mã SP:
                                        {{ isset($item->product->id) ? strtoupper(substr(md5($item->product->id), 0, 8)) : 'SP123456' }}
                                    </div>
                                </td>
                                <td class="text-center">Size M</td>
                                <td class="text-center text-danger">₫{{ $item->product->price}}</td>
                                <td class="text-center">{{ $item->quantity ?? 1 }}</td>
                                <td class="text-center text-danger fw-bold">
                                    ₫{{ $item->product->price  * $item->quantity  }}
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Tổng kết đơn hàng -->
        <div class="row justify-content-end">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-lg mb-4 border-0 checkout-card"
                    style="border-radius:22px; background: linear-gradient(90deg, #fff 70%, #fff0e6 100%);">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between mb-2 fs-5">
                            <span><i class="fas fa-receipt me-2 text-danger"></i> Tạm tính</span>
                            <span class="fw-bold text-dark">
                                ₫{{ collect($checkoutList)->sum(function($i) { return $i->product->price * $i->quantity; }) }}
                            </span>
                        </div>
                        <div class="d-flex justify-content-between mb-2 fs-5">
                            <span><i class="fas fa-truck me-2 text-primary"></i> Phí vận chuyển</span>
                            <span class="fw-bold text-dark">20.000<sup
                                    style="color: red; font-family: 'Lato', sans-serif; font-size: 16px; text-decoration:underline;">đ</sup></span>
                        </div>
                        <div class="d-flex justify-content-between mb-2 align-items-center fs-5">
                            <span><i class="fas fa-ticket-alt me-2 text-warning"></i> Voucher Shopee</span>
                            <a href="#" class="text-decoration-none text-primary small">Chọn hoặc nhập mã</a>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="fw-bold fs-4"><i class="fas fa-money-check-alt me-2 text-success"></i> Tổng
                                thanh toán</span>
                            <span class="fw-bold fs-2 text-danger">
                                ₫{{ collect($checkoutList)->sum(function($i){ return ($i->product->price ?? 0)*($i->quantity ?? 1); }) + 20.000 }}
                            </span>
                        </div>
                        <div class="mb-3">
                            <span class="fw-bold">Phương thức thanh toán:</span>
                            <div class="mt-2 d-flex flex-wrap gap-3">
                                <div class="form-check form-check-inline d-flex align-items-center gap-2">
                                    <input class="form-check-input" type="radio" name="payment_method" id="cod"
                                        value="cod" checked>
                                    <label class="form-check-label" for="cod"><i
                                            class="fas fa-money-bill-wave text-success me-1"></i> Thanh toán khi nhận
                                        hàng</label>
                                </div>
                                <div class="form-check form-check-inline d-flex align-items-center gap-2">
                                    <input class="form-check-input" type="radio" name="payment_method" id="momo"
                                        value="momo">
                                    <label class="form-check-label" for="momo"><img
                                            src="{{ asset('assets/images/momo.png') }}" alt="MoMo" style="height:22px;">
                                        Ví MoMo</label>
                                </div>
                                <div class="form-check form-check-inline d-flex align-items-center gap-2">
                                    <input class="form-check-input" type="radio" name="payment_method" id="bank"
                                        value="bank">
                                    <label class="form-check-label" for="bank"><i
                                            class="fas fa-university text-primary me-1"></i> Chuyển khoản ngân
                                        hàng</label>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-danger btn-lg w-100 fw-bold rounded-pill shadow-lg mt-3"
                            style="font-size: 1.3rem; background: linear-gradient(90deg,#ee4d2d 60%,#ffbfae 100%); border: none; letter-spacing:1px;">
                            <i class="fas fa-shopping-cart me-2"></i> Đặt hàng
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<style>
.checkout-card {
    box-shadow: 0 6px 32px rgba(238, 77, 45, 0.08) !important;
    border-radius: 22px !important;
}

.product-row:hover {
    background: #fff7f2 !important;
}

.btn-danger {
    background-color: #ee4d2d !important;
    border-color: #ee4d2d !important;
}

.btn-danger:hover {
    background-color: #d0391e !important;
    border-color: #d0391e !important;
}

.form-control:focus {
    box-shadow: 0 0 0 0.2rem #ee4d2d33;
    border-color: #ee4d2d;
}

.form-floating>label {
    color: #ee4d2d;
    font-weight: 500;
}

@media (max-width: 768px) {
    .container-xl {
        padding: 0 4px !important;
    }

    .card-body,
    .card-header {
        padding: 1rem !important;
    }

    .fs-2,
    .fs-3,
    .fs-4 {
        font-size: 1.2rem !important;
    }

    .fs-5 {
        font-size: 1rem !important;
    }

    .btn-lg {
        font-size: 1rem !important;
    }

    .checkout-card {
        border-radius: 14px !important;
    }
}
</style>
@endsection