@extends('layouts.app')

@section('title', 'Giỏ hàng - Shopee')

@section('content')
<div class="container-xl py-5">
    <h2 class="mb-4 fw-bold text-danger d-flex align-items-center">
        <img src="{{ asset('assets/images/shopee_logo.png') }}" alt="Shopee Logo"
            style="height: 36px; margin-right: 12px;">
        <span class="fs-4">Giỏ Hàng</span>
    </h2>

    <div class="card shadow-lg rounded-3 overflow-hidden">
        <div class="card-header bg-white d-flex align-items-center border-0 py-3"
            style="font-weight: 600; font-family: 'Lato', sans-serif;">
            <div class="form-check me-3">
                <input class="form-check-input select-all-checkbox" type="checkbox" id="selectAll">
                <label class="form-check-label ms-1" for="selectAll">Tất cả</label>
            </div>
            <div class="flex-grow-1 text-dark">Sản phẩm</div>
            <div class="text-center text-dark" style="width: 120px;">Đơn giá</div>
            <div class="text-center text-dark" style="width: 120px;">Số lượng</div>
            <div class="text-center text-dark" style="width: 120px;">Thành tiền</div>
            <div class="text-center text-dark" style="width: 100px;">Thao tác</div>
        </div>

        <div class="border-bottom bg-light py-2 px-4 d-flex align-items-center text-muted small">
            <span class="badge bg-danger me-2">Yêu thích+</span>
            <span class="me-2"><i class="fa fa-store text-warning"></i></span>
            Duyên Hà Shop - Habill Store
        </div>

        @if(isset($cartList) && $cartList->isEmpty())
        <div class="text-center py-5 text-muted">
            <i class="fas fa-shopping-cart fa-3x mb-3" style="color: #ccc;"></i>
            <p class="fs-5">Giỏ hàng của bạn đang trống.</p>
            <a href="{{ route('home') }}" class="btn btn-outline-danger mt-3">Mua sắm ngay</a>
        </div>
        @else
        @if(isset($cartList))
        @foreach ($cartList as $cart)
        @if (is_object($cart) && isset($cart->product) && $cart->product)
        <div class="cart-item d-flex align-items-center px-4 py-3 border-bottom bg-white position-relative transition-all duration-300"
            style="cursor: pointer;">
            <div class="form-check me-3">
                <input class="form-check-input cart-item-checkbox" type="checkbox" data-id="{{ $cart->id }}">
            </div>
            <div class="d-flex align-items-center flex-grow-1 gap-3">
                <img src="assets/images/{{ $cart->product->image ?? 'default.png' }}"
                    alt="{{ $cart->product->name ?? '' }}" class="rounded-2 border"
                    style="width: 80px; height: 80px; object-fit: cover; transition: transform 0.3s;">
                <div class="d-flex flex-column justify-content-between" style="min-width: 0;">
                    <div class="fw-bold text-dark text-truncate"
                        style="font-size: 14px; font-family: 'Lato', sans-serif; max-width: 200px;">
                        {{ $cart->product->name ?? '' }}
                    </div>
                    <small class="text-muted">Mã SP:
                        {{ isset($cart->product->id) ? strtoupper(substr(md5($cart->product->id), 0, 8)) : '' }}</small>
                </div>
            </div>
            <div class="text-center text-danger fw-bold unit-price" style="width: 120px; font-size: 1.1rem;"
                data-price="{{ $cart->product->price  }}">
                ₫{{$cart->product->price  }}
            </div>
            <div class="text-center" style="width: 120px;">
                <div class="input-group input-group-sm justify-content-center flex-nowrap" style="max-width: 120px;">
                    <button class="btn btn-outline-secondary quantity-btn px-2" type="button"
                        data-action="decrease">-</button>
                    <input type="number" class="form-control text-center quantity-input border-0"
                        value="{{ $cart->quantity ?? 1 }}" min="1" style="width: 50px; font-size: 0.9rem;">
                    <button class="btn btn-outline-secondary quantity-btn px-2" type="button"
                        data-action="increase">+</button>
                </div>
            </div>
            <div class="text-center text-danger fw-bold fs-5 item-total" style="width: 120px;">
                ₫{{ $cart->product->price  * $cart->quantity ?? 1 }}
            </div>
            <div class="text-center" style="width: 100px;">
                <button class="btn btn-link text-danger delete-btn p-0 fw-bold" data-id="{{ $cart->id }}"
                    style="font-size: 1.1rem; text-decoration: none;">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        </div>
        @endif
        @endforeach
        @endif
        @endif

        <div class="px-4 py-2 bg-light text-muted small d-flex align-items-center">
            <i class="fa fa-truck text-info me-2"></i>
            Giảm 47.000đ phí vận chuyển đơn từ 400.000đ <a href="#" class="ms-1 text-decoration-none">Tìm hiểu thêm</a>
        </div>

        <div class="px-4 py-3 bg-white d-flex align-items-center justify-content-between border-top">
            <div class="d-flex align-items-center">
                <div class="form-check me-3">
                    <input class="form-check-input" type="checkbox" id="selectAllBottom">
                    <label class="form-check-label ms-1" for="selectAllBottom">Chọn tất cả
                        ({{ isset($cartList) ? $cartList->count() : 0 }})</label>
                </div>
                <button class="btn btn-link text-danger me-3" style="text-decoration: none">Xóa</button>
                <button class="btn btn-link text-warning me-3" style="text-decoration: none">Lưu yêu thích</button>
            </div>
            <div class="d-flex align-items-center">
                <span class="me-2 text-muted">Shopee Voucher:</span>
                <a href="#" class="text-decoration-none text-primary">Chọn hoặc nhập mã</a>
            </div>
        </div>

        <div class="px-4 py-4 bg-white d-flex align-items-center justify-content-end border-top">
            <span class="me-3 text-muted">Tổng cộng (<span class="selected-count">0</span> sản phẩm):</span>
            <span class="price text-danger fw-bold fs-4 me-3">₫0</span>
            <button class="btn btn-danger btn-lg fw-bold px-5 rounded-pill">Mua hàng</button>
        </div>
    </div>

    <div class="mt-5 px-2 px-md-4 py-4 bg-light rounded-3">
        <h5 class="fw-bold mb-4 text-dark" style="font-family: 'Lato', sans-serif;">CÓ THỂ BẠN CŨNG THÍCH</h5>
        <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 g-3 justify-content-center">
            @if(isset($productList) && count($productList) > 0)
            @foreach (collect($productList)->random(min(6, count($productList))) as $products)
            <div class="col d-flex align-items-stretch">
                <a href="/products/{{ $products->id }}/detail"
                    class="card h-100 border-0 shadow-sm text-decoration-none product-suggestion-card mx-auto my-2 position-relative"
                    style="transition: all 0.3s ease; max-width: 180px; border-radius: 12px; overflow: hidden;">
                    @if(!empty($products->price_old) && $products->price_old > $products->price)
                    <span class="badge bg-danger position-absolute top-0 start-0 m-2" style="z-index: 1;">
                        -{{ round((($products->price_old - $products->price) / $products->price_old) * 100) }}%
                    </span>
                    @endif
                    <img src="assets/images/{{ $products->image ?? 'default.png' }}" class="card-img-top"
                        alt="{{ $products->name ?? '' }}"
                        style="object-fit: cover; height: 140px; border-radius: 12px 12px 0 0;">
                    <div class="card-body p-3 d-flex flex-column justify-content-between">
                        <div class="fw-semibold text-dark text-truncate-2"
                            style="font-size: 0.9rem; min-height: 2.5em;">
                            {{ $products->name ?? '' }}
                        </div>
                        <div class="d-flex align-items-center gap-2 mt-2">
                            <span class="text-danger fw-bold" style="font-size: 1rem;">
                                ₫{{ $products->price ?? 0}}
                            </span>
                            @if(!empty($products->price_old) && $products->price_old > $products->price)
                            <span class="text-muted text-decoration-line-through" style="font-size: 0.85rem;">
                                ₫{{ $products->price_old ?? 0 }}
                            </span>
                            @endif
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
            @endif
        </div>
    </div>
</div>

<style>
.product-suggestion-card {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.product-suggestion-card:hover {
    box-shadow: 0 8px 24px rgba(238, 77, 45, 0.15);
    transform: translateY(-5px) scale(1.02);
}

.product-suggestion-card .card-img-top {
    background: #fff;
}

.cart-item:hover {
    box-shadow: 0 6px 20px rgba(238, 77, 45, 0.1);
    background: #fffefb;
}

.cart-item img {
    transition: transform 0.3s ease;
}

.cart-item:hover img {
    transform: scale(1.05);
}

.text-truncate-2 {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.quantity-btn {
    font-size: 0.9rem;
    padding: 0 8px;
}

.quantity-input {
    border-left: none !important;
    border-right: none !important;
}

.btn-danger {
    background-color: #ee4d2d !important;
    border-color: #ee4d2d !important;
}

.btn-danger:hover {
    background-color: #d0391e !important;
    border-color: #d0391e !important;
}
</style>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const selectAll = document.getElementById('selectAll');
    const selectAllBottom = document.getElementById('selectAllBottom');
    const cartItems = document.querySelectorAll('.cart-item-checkbox');
    const quantityButtons = document.querySelectorAll('.quantity-btn');
    const deleteButtons = document.querySelectorAll('.delete-btn');
    const selectedCount = document.querySelector('.selected-count');
    const priceTotal = document.querySelector('.price');

    // Helper: safe selector
    function safe(el) {
        return el ? el : {
            checked: false,
            value: 0,
            textContent: ''
        };
    }

    // Select all checkbox functionality
    function updateSelection() {
        const allChecked = Array.from(cartItems).length > 0 && Array.from(cartItems).every(checkbox => checkbox
            .checked);
        if (selectAll) selectAll.checked = allChecked;
        if (selectAllBottom) selectAllBottom.checked = allChecked;
        updateTotal();
    }

    if (selectAll) {
        selectAll.addEventListener('change', function() {
            cartItems.forEach(checkbox => checkbox.checked = this.checked);
            if (selectAllBottom) selectAllBottom.checked = this.checked;
            updateTotal();
        });
    }

    if (selectAllBottom) {
        selectAllBottom.addEventListener('change', function() {
            cartItems.forEach(checkbox => checkbox.checked = this.checked);
            if (selectAll) selectAll.checked = this.checked;
            updateTotal();
        });
    }

    cartItems.forEach(checkbox => {
        checkbox.addEventListener('change', updateSelection);
    });

    // Quantity adjustment
    quantityButtons.forEach(button => {
        button.addEventListener('click', function() {
            const input = this.parentElement.querySelector('.quantity-input');
            let value = parseInt(input.value);
            if (this.dataset.action === 'decrease' && value > 1) value--;
            if (this.dataset.action === 'increase') value++;
            input.value = value;
            updateTotal();
        });
    });

    // Delete functionality (placeholder)
    deleteButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
                const cartId = this.dataset.id;
                // Add AJAX call to remove item from cart
                const item = this.closest('.cart-item');
                if (item) item.remove();
                updateSelection();
            }
        });
    });

    // Update total price and count
    function updateTotal() {
        let total = 0;
        let count = 0;
        cartItems.forEach(checkbox => {
            const row = checkbox.closest('.cart-item');
            if (!row) return;
            const quantityInput = row.querySelector('.quantity-input');
            const unitPriceEl = row.querySelector('.unit-price');
            const itemTotalEl = row.querySelector('.item-total');
            let quantity = quantityInput ? parseInt(quantityInput.value) : 1;
            let price = unitPriceEl ? parseInt(unitPriceEl.dataset.price.replace(/\./g, '')) : 0;
            // Update item total
            if (itemTotalEl) {
                itemTotalEl.textContent =
                    `₫${(price * quantity).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')}`;
            }
            if (checkbox.checked) {
                total += price * quantity;
                count++;
            }
        });
        if (selectedCount) selectedCount.textContent = count;
        if (priceTotal) priceTotal.textContent = `₫${total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')}`;
    }

    // Initial update
    updateTotal();
});
</script>
@endpush
@endsection