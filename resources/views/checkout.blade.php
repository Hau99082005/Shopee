@extends('layouts.app');

@section('title', 'Thanh toán - Shopee')

@section('content')
<div class="container-xl py-5">
    <div class="mb-4 d-flex align-items-center gap-2">
        <img src="{{ asset('assets/images/shopee_logo.png') }}" alt="Shopee Logo" style="height: 48px;">
        <span class="fs-2 fw-bold text-danger" style="font-family: 'Lato',sans-serif; letter-spacing:1px;">Shopee</span>
        <span class="fs-3 fw-bold text-dark ms-2" style="font-family: 'Lato',sans-serif;">Thanh Toán</span>
    </div>
    <!-- Địa chỉ nhận hàng -->
    <div class="card shadow mb-4 border-0" style="border-radius:18px; background: linear-gradient(90deg, #fff 70%, #fff0e6 100%);">
        <div class="card-body d-flex justify-content-between align-items-center py-4 px-4">
            <div class="d-flex align-items-center gap-3">
                <div class="bg-danger bg-gradient rounded-circle d-flex align-items-center justify-content-center" style="width:44px;height:44px;">
                    <i class="fas fa-map-marker-alt text-white fs-4"></i>
                </div>
                <div>
                    <div class="fw-bold mb-1 fs-5">Địa chỉ nhận hàng</div>
                    <div class="text-dark">Nguyễn Văn A <span class="mx-2">|</span> 0912345678</div>
                    <div class="text-muted small">123 Đường Shopee, Quận 1, TP.HCM</div>
                </div>
            </div>
            <a href="#" class="btn btn-outline-danger rounded-pill px-4 fw-bold">Sửa</a>
        </div>
    </div>
    <!-- Danh sách sản phẩm -->
    <div class="card shadow-sm mb-4 border-0" style="border-radius:18px;">
        <div class="card-header bg-white fw-bold fs-5 border-0" style="border-radius:18px 18px 0 0;">Sản phẩm</div>
        <div class="card-body p-0" style="background:linear-gradient(90deg,#fff 80%,#fff7f2 100%); border-radius:0 0 18px 18px;">
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
                        @php
                        // Dữ liệu mẫu nếu chưa có biến truyền vào
                        $checkoutList = isset($cartList) ? $cartList : [
                            (object)[
                                'product' => (object)[
                                    'image' => 'ao_so_mi.webp',
                                    'name' => 'Áo sơ mi nam basic',
                                    'price' => 99000
                                ],
                                'quantity' => 2
                            ],
                            (object)[
                                'product' => (object)[
                                    'image' => 'thatlung.jpg',
                                    'name' => 'Thắt lưng nam da',
                                    'price' => 120000
                                ],
                                'quantity' => 1
                            ]
                        ];
                        @endphp
                        @foreach ($checkoutList as $item)
                        <tr class="product-row" style="transition:background 0.2s;">
                            <td style="width: 80px;">
                                <img src="{{ asset('assets/images/' . ($item->product->image ?? 'default.png')) }}" alt="{{ $item->product->name ?? '' }}" class="rounded-2 border" style="width: 60px; height: 60px; object-fit: cover;">
                            </td>
                            <td style="min-width: 180px;">
                                <div class="fw-semibold text-dark" style="font-size:1.08rem;">{{ $item->product->name ?? '' }}</div>
                                <div class="text-muted small">Mã SP: {{ isset($item->product->id) ? strtoupper(substr(md5($item->product->id), 0, 8)) : 'SP123456' }}</div>
                            </td>
                            <td class="text-center">Size M</td>
                            <td class="text-center text-danger">₫{{ number_format($item->product->price ?? 0, 0, ',', '.') }}</td>
                            <td class="text-center">{{ $item->quantity ?? 1 }}</td>
                            <td class="text-center text-danger fw-bold">₫{{ number_format(($item->product->price ?? 0) * ($item->quantity ?? 1), 0, ',', '.') }}</td>
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
            <div class="card shadow-lg mb-4 border-0" style="border-radius:18px; background: linear-gradient(90deg, #fff 70%, #fff0e6 100%);">
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between mb-2 fs-5">
                        <span>Tạm tính</span>
                        <span class="fw-bold text-dark">
                            ₫{{ number_format(collect($checkoutList)->sum(function($i){return ($i->product->price ?? 0)*($i->quantity ?? 1);}), 0, ',', '.') }}
                        </span>
                    </div>
                    <div class="d-flex justify-content-between mb-2 fs-5">
                        <span>Phí vận chuyển</span>
                        <span class="fw-bold text-dark">₫20.000</span>
                    </div>
                    <div class="d-flex justify-content-between mb-2 align-items-center fs-5">
                        <span>Voucher Shopee</span>
                        <a href="#" class="text-decoration-none text-primary small">Chọn hoặc nhập mã</a>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="fw-bold fs-4">Tổng thanh toán</span>
                        <span class="fw-bold fs-2 text-danger">
                            ₫{{ number_format(collect($checkoutList)->sum(function($i){return ($i->product->price ?? 0)*($i->quantity ?? 1);}) + 20000, 0, ',', '.') }}
                        </span>
                    </div>
                    <div class="mb-3">
                        <span class="fw-bold">Phương thức thanh toán:</span>
                        <div class="mt-2 d-flex flex-wrap gap-3">
                            <div class="form-check form-check-inline d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="payment_method" id="cod" checked>
                                <label class="form-check-label" for="cod"><i class="fas fa-money-bill-wave text-success me-1"></i> Thanh toán khi nhận hàng</label>
                            </div>
                            <div class="form-check form-check-inline d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="payment_method" id="momo">
                                <label class="form-check-label" for="momo"><img src="{{ asset('assets/images/momo.png') }}" alt="MoMo" style="height:22px;"> Ví MoMo</label>
                            </div>
                            <div class="form-check form-check-inline d-flex align-items-center gap-2">
                                <input class="form-check-input" type="radio" name="payment_method" id="bank">
                                <label class="form-check-label" for="bank"><i class="fas fa-university text-primary me-1"></i> Chuyển khoản ngân hàng</label>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-danger btn-lg w-100 fw-bold rounded-pill shadow-lg" style="font-size: 1.3rem; background: linear-gradient(90deg,#ee4d2d 60%,#ffbfae 100%); border: none;">Đặt hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
.card {
    border-radius: 18px;
}
.table > :not(:last-child) > :last-child > * {
    border-bottom-color: #f5f5f5;
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
@media (max-width: 768px) {
    .container-xl { padding: 0 4px !important; }
    .card-body, .card-header { padding: 1rem !important; }
    .fs-2, .fs-3, .fs-4 { font-size: 1.2rem !important; }
    .fs-5 { font-size: 1rem !important; }
    .btn-lg { font-size: 1rem !important; }
}
</style>
@endsection