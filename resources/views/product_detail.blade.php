@extends('layouts.app')
@section('title', $product->name ?? 'Chi tiết sản phẩm')

@section('content')
<div class="container-xl py-4">
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb bg-white px-3 py-2 rounded">
            <li class="breadcrumb-item"><a href="/"
                    style="color: black; text-decoration: none; font-family: 'Lato', sans-serif;">Shopee</a></li>
            <li class="breadcrumb-item">
                <a href="{{ route('products', ['categories[]' => $product->category->id ?? '']) }}"
                    style="color: black; text-decoration: none; font-family: 'Lato', sans-serif;">
                    {{ $product->category->name ?? 'Danh mục' }}
                </a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">{{ $product->name }}</li>
        </ol>
    </nav>
    <div class="row g-4">
        <div class="col-md-5">
            <div class="border rounded bg-white p-3">
                <div class="mb-3 text-center">
                    <img src="{{ asset('assets/images/' . ($product->image ?? 'logo1.jpg')) }}"
                        alt="{{ $product->name }}" class="img-fluid main-img"
                        style="max-height: 350px; object-fit: contain;">
                </div>
                <div class="d-flex align-items-center justify-content-center pt-2" style="gap: 8px;">
                    <button id="thumbLeft" class="btn btn-light p-1 border" style="height: 40px; width: 32px;"><i
                            class="fa fa-chevron-left"></i></button>
                    <div id="thumbsContainer" class="d-flex gap-2"
                        style="overflow-x: auto; scroll-behavior: smooth; max-width: 320px; scrollbar-width: none; -ms-overflow-style: none;">
                        @foreach($product_images as $img)
                        <img src="{{ asset('assets/images/' . $img->image_url) }}" alt="thumb" class="img-thumbnail"
                            style="width: 60px; height: 60px; object-fit: cover; cursor:pointer;">
                        @endforeach
                    </div>
                    <button id="thumbRight" class="btn btn-light p-1 border" style="height: 40px; width: 32px;"><i
                            class="fa fa-chevron-right"></i></button>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="border rounded bg-white p-4 h-100 d-flex flex-column justify-content-between">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <span class="badge bg-danger">Yêu Thích</span>
                        <span class="fw-bold fs-5">{{ $product->name }}</span>
                    </div>
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <span class="text-warning"><i class="fa fa-star"></i> 4.7</span>
                        <span class="text-muted">|</span>
                        <span>4,2k Đánh Giá</span>
                        <span class="text-muted">|</span>
                        <span>8,5k Đã Bán</span>
                    </div>
                    <div class="bg-light border rounded p-3 mb-3 d-flex align-items-center justify-content-between">
                        <div>
                            <span class="badge bg-danger">FLASH SALE</span>
                            <span class="fs-2 fw-bold text-danger ms-2">
                                ₫{{ $product->price }}
                            </span>
                            @if(!empty($product->price_old) && $product->price_old > $product->price)
                            <span class="text-muted text-decoration-line-through ms-2">
                                ₫{{ $product->price_old}}
                            </span>
                            <span class="badge bg-warning text-dark ms-2">
                                -{{ round((($product->price_old - $product->price) / $product->price_old) * 100) }}%
                            </span>
                            @endif
                        </div>
                        <div class="d-flex align-items-center gap-2">
                            <span class="text-danger fw-bold">KẾT THÚC TRONG</span>
                            <span id="countdown" class="text-white px-2 py-1 rounded"
                                style="background: orangered">02:03:21</span>
                        </div>
                    </div>
                    <!-- Vận chuyển, voucher -->
                    <div class="mb-3">
                        <span class="me-3"><i class="fa fa-truck text-success"></i> Nhận từ 30 Th06 - 2 Th07, phí giao
                            ₫0</span>
                        <span class="badge bg-info text-dark">Voucher SIÊU RẺ</span>
                    </div>
                    <!-- Chọn màu sắc, size, chất liệu, xuất xứ, bảo hành -->
                    <ul class="list-unstyled mb-3">
                        @if(!empty($product->detail->color))<li><b>Màu sắc:</b> {{ $product->detail->color }}</li>@endif
                        @if(!empty($product->detail->size))<li><b>Kích thước:</b> {{ $product->detail->size }}</li>
                        @endif
                        @if(!empty($product->detail->material))<li><b>Chất liệu:</b> {{ $product->detail->material }}
                        </li>@endif
                        @if(!empty($product->detail->origin))<li><b>Xuất xứ:</b> {{ $product->detail->origin }}</li>
                        @endif
                        @if(!empty($product->detail->warranty))<li><b>Bảo hành:</b> {{ $product->detail->warranty }}
                        </li>@endif
                    </ul>
                    <!-- Mô tả -->
                    <div class="mb-3">
                        <b>Mô tả sản phẩm:</b>
                        <div class="border rounded p-2 bg-light mt-1" style="white-space: pre-line;">
                            {{ $product->detail->description ?? $product->description }}
                        </div>
                    </div>
                </div>
                <!-- Nút mua -->
                <div class="mt-4 d-flex gap-3 align-items-center">
                    <input id="add-to-cart-qty" type="number" value="1" min="1" class="form-control w-auto"
                        style="max-width: 80px; font-family: 'Lato';">
                    <button id="buy-now-btn" class="btn btn-warning px-4 fw-bold">Mua ngay</button>
                    <button id="add-to-cart-btn" class="btn btn-danger px-4 fw-bold">
                        Thêm vào giỏ hàng <i class="fa fa-cart-plus ms-2"></i>
                    </button>
                </div>
                <div id="add-to-cart-alert" class="alert alert-success mt-3 d-none" role="alert"
                    style="font-family: 'Lato';">
                    Đã thêm vào giỏ hàng!
                </div>
            </div>
        </div>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Đồng hồ đếm ngược Flash Sale
    let duration = 2 * 60 * 60 + 3 * 60 + 21; // 2 giờ 3 phút 21 giây
    const countdownEl = document.getElementById('countdown');

    function updateCountdown() {
        let h = Math.floor(duration / 3600);
        let m = Math.floor((duration % 3600) / 60);
        let s = duration % 60;
        countdownEl.textContent =
            (h < 10 ? '0' : '') + h + ':' +
            (m < 10 ? '0' : '') + m + ':' +
            (s < 10 ? '0' : '') + s;
        if (duration > 0) duration--;
    }
    updateCountdown();
    setInterval(updateCountdown, 1000);

    // Slider ảnh nhỏ
    const container = document.getElementById('thumbsContainer');
    document.getElementById('thumbLeft').onclick = function() {
        container.scrollBy({
            left: -120,
            behavior: 'smooth'
        });
    };
    document.getElementById('thumbRight').onclick = function() {
        container.scrollBy({
            left: 120,
            behavior: 'smooth'
        });
    };

    const addToCartBtn = document.getElementById('add-to-cart-btn');
    const qtyInput = document.getElementById('add-to-cart-qty');
    const alertBox = document.getElementById('add-to-cart-alert');
    addToCartBtn.addEventListener('click', function() {
        const productId = {
            {
                $product - > id
            }
        };
        const quantity = parseInt(qtyInput.value) || 1;
        fetch('/api/cart', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute(
                        'content'),
                    ...(localStorage.getItem('token') ? {
                        'Authorization': 'Bearer ' + localStorage.getItem('token')
                    } : {})
                },
                body: JSON.stringify({
                    product_id: productId,
                    quantity: quantity
                })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alertBox.classList.remove('d-none');
                    setTimeout(() => alertBox.classList.add('d-none'), 2000);
                    updateCartCount();
                } else {
                    alertBox.classList.remove('alert-success');
                    alertBox.classList.add('alert-danger');
                    alertBox.textContent = data.message || 'Có lỗi xảy ra!';
                    alertBox.classList.remove('d-none');
                    setTimeout(() => {
                        alertBox.classList.add('d-none');
                        alertBox.classList.remove('alert-danger');
                        alertBox.classList.add('alert-success');
                        alertBox.textContent = 'Đã thêm vào giỏ hàng!';
                    }, 2500);
                }
            })
            .catch(() => {
                alertBox.classList.remove('alert-success');
                alertBox.classList.add('alert-danger');
                alertBox.textContent = 'Có lỗi xảy ra!';
                alertBox.classList.remove('d-none');
                setTimeout(() => {
                    alertBox.classList.add('d-none');
                    alertBox.classList.remove('alert-danger');
                    alertBox.classList.add('alert-success');
                    alertBox.textContent = 'Đã thêm vào giỏ hàng!';
                }, 2500);
            });
    });

    function updateCartCount() {
        fetch('/api/cart', {
                headers: {
                    'Accept': 'application/json',
                    ...(localStorage.getItem('token') ? {
                        'Authorization': 'Bearer ' + localStorage.getItem('token')
                    } : {})
                }
            })
            .then(res => res.json())
            .then(data => {
                if (data.success && data.data && data.data.summary) {
                    const count = data.data.summary.total_quantity || 0;
                    const badge = document.querySelector('.cart-count-badge');
                    if (badge) badge.textContent = count;
                }
            });
    }
});
</script>
<style>
#thumbsContainer::-webkit-scrollbar {
    display: none;
}
</style>
@endsection