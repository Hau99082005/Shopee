@extends('layouts.app')

@section('title', 'Kết quả tìm kiếm')

@section('content')
<div class="shopee-search-page-layout">
    <div class="container-fluid mt-3">
        <div class="row">
            <aside class="col-lg-2 col-md-3">
                <div class="sidebar-filters">
                    <div class="filter-header d-flex align-items-center mb-3">
                        <i class="fas fa-filter me-2"></i>
                        <h5 class="mb-0 text-uppercase">Bộ lọc tìm kiếm</h5>
                    </div>

                    <form id="filter-form" method="GET" action="{{ route('products') }}">
                        <input type="hidden" name="sort" value="{{ request('sort') }}">
                        <input type="hidden" name="order" value="{{ request('order') }}">
                        <input type="hidden" name="search" value="{{ request('search') }}">

                        <!-- Category Filter -->
                        <div class="filter-group mb-4">
                            <label class="form-label fw-bold">Theo Danh mục</label>
                            <ul class="list-unstyled filter-list">
                                @foreach($categories as $category)
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="categories[]"
                                            value="{{ $category->id }}" id="cat-{{ $category->id }}"
                                            @if(in_array($category->id, request('categories', []))) checked @endif>
                                        <label class="form-check-label" for="cat-{{ $category->id }}">
                                            {{ $category->name }}
                                        </label>
                                    </div>
                                </li>
                                @endforeach
                            </ul>
                        </div>


                        <div class="filter-group mb-4">
                            <label class="form-label fw-bold">Đánh giá</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rating" id="rating-5" value="5"
                                    @if(request('rating')==5) checked @endif>
                                <label class="form-check-label d-flex align-items-center" for="rating-5">
                                    <div class="text-warning me-1">
                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i><i class="fas fa-star"></i><i
                                            class="fas fa-star"></i>
                                    </div>
                                </label>
                            </div>

                        </div>


                        <div class="filter-group mb-4">
                            <label class="form-label fw-bold">Khoảng giá</label>
                            <div class="row g-2 align-items-center">
                                <div class="col-5">
                                    <input type="number" class="form-control" name="min_price" placeholder="Từ"
                                        value="{{ request('min_price') }}">
                                </div>
                                <div class="col-1 text-center">-</div>
                                <div class="col-5">
                                    <input type="number" class="form-control" name="max_price" placeholder="Đến"
                                        value="{{ request('max_price') }}">
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 mb-2 text-uppercase">Áp dụng</button>
                        <a href="{{ route('products') }}" class="btn btn-light w-100 border">Xóa tất cả</a>
                    </form>
                </div>
            </aside>

            <main class="col-lg-10 col-md-9">

                <div class="shopee-section mb-3">
                    <div class="sort-bar d-flex justify-content-between align-items-center p-3">
                        <div class="d-flex align-items-center">
                            <span class="me-3 d-none d-lg-block">Sắp xếp theo</span>
                            <a href="{{ route('products', array_merge(request()->query(), ['sort' => 'relevance'])) }}"
                                class="btn btn-sm {{ request('sort', 'relevance') == 'relevance' ? 'btn-primary' : 'btn-light' }}">Liên
                                quan</a>
                            <a href="{{ route('products', array_merge(request()->query(), ['sort' => 'created_at'])) }}"
                                class="btn btn-sm {{ request('sort') == 'created_at' ? 'btn-primary' : 'btn-light' }}">Mới
                                nhất</a>
                            <a href="{{ route('products', array_merge(request()->query(), ['sort' => 'sales'])) }}"
                                class="btn btn-sm {{ request('sort') == 'sales' ? 'btn-primary' : 'btn-light' }}">Bán
                                chạy</a>
                            <div class="dropdown">
                                <a class="btn btn-sm btn-light dropdown-toggle" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Giá
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item"
                                            href="{{ route('products', array_merge(request()->query(), ['sort' => 'price', 'order' => 'asc'])) }}">Giá:
                                            Thấp đến Cao</a></li>
                                    <li><a class="dropdown-item"
                                            href="{{ route('products', array_merge(request()->query(), ['sort' => 'price', 'order' => 'desc'])) }}">Giá:
                                            Cao đến Thấp</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="d-flex align-items-center">
                            <small class="text-muted">
                                <span
                                    class="text-primary">{{ $products->currentPage() }}</span>/{{ $products->lastPage() }}
                            </small>
                            <div class="ms-2 btn-group">
                                <a href="{{ $products->previousPageUrl() }}"
                                    class="btn btn-sm btn-outline-secondary {{ $products->onFirstPage() ? 'disabled' : '' }}"><i
                                        class="fas fa-chevron-left"></i></a>
                                <a href="{{ $products->nextPageUrl() }}"
                                    class="btn btn-sm btn-outline-secondary {{ !$products->hasMorePages() ? 'disabled' : '' }}"><i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                @if(isset($products) && $products->count() > 0)
                <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-3">
                    @foreach($products as $product)
                    <div class="col">
                        <a href="{{ route('products.detail', ['id' => $product->id]) }}"
                            class="product-card text-decoration-none shadow-sm h-100 d-flex flex-column align-items-center position-relative">
                            <div class="product-card__image-wrapper mb-2"
                                style="width:100%; aspect-ratio:1/1; overflow:hidden; border-radius:12px; background:#fafafa;">
                                <img src="{{ asset('assets/images/' . $product->image) }}" alt="{{ $product->name }}"
                                    class="product-card__image"
                                    style="width:100%; height:100%; object-fit:cover; border-radius:12px;">
                            </div>
                            <div class="product-card__body text-center w-100">
                                <div class="product-card__title mb-1" style="font-weight:600;">{{ $product->name }}
                                </div>
                                <button class="btn add-to-cart-btn mb-2" type="button">
                                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> Thêm vào giỏ hàng
                                </button>
                                <div class="d-flex align-items-center justify-content-center mb-1" style="gap: 0.5rem;">
                                    <div class="product-card__price text-danger" style="font-size:1.1rem;">
                                        <small> <span
                                                class="product-card__price-currency">₫</span>{{ $product->price}}</small>
                                        <small
                                            style="font-family: 'Latp', sans-serif; font-size: 16; color: gray; text-decoration:line-through">
                                            <span
                                                class="product-card__price-currency">₫</span>{{ $product->price_old}}</small>
                                    </div>
                                    <i class="fa fa-shopping-cart text-warning" aria-hidden="true"
                                        style="font-size:1.2rem;"></i>
                                </div>
                                <div class="d-flex align-items-center justify-content-center gap-2 mb-1">
                                    <span class="badge bg-warning text-dark" style="font-size:0.8rem;">
                                        <i class="fa fa-star text-warning me-1"
                                            aria-hidden="true"></i>{{ rand(45,50)/10 }}
                                    </span>
                                    <span class="text-muted small">Đã bán {{ round(rand(100, 5000)/100, 1) }}k</span>
                                </div>
                                <div class="product-card__location text-secondary small">Hà Nội</div>
                            </div>
                            <div class="position-absolute top-0 start-0 m-2">
                                <span class="badge bg-danger rounded-pill px-2 py-1" style="font-size:0.75rem;">Yêu
                                    thích+</span>
                            </div>
                            <div class="position-absolute top-0 end-0 m-2">
                                <span class="badge bg-warning text-danger rounded-pill px-2 py-1"
                                    style="font-size:0.75rem;">{{ rand(10, 50) }}% GIẢM</span>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
                <div class="d-flex justify-content-center mt-4">
                    {{ $products->appends(request()->query())->links() }}
                </div>
                @else
                <div class="text-center py-5">
                    <img src="{{ asset('assets/images/undraw_document-search_2o7x.png') }}" alt="Không tìm thấy"
                        style="width:200px; height:200px;">
                    <h5 class="text-muted mt-3" style="font-family: Lato, sans-serif;">Không tìm thấy kết quả nào</h5>
                    <p class="text-muted small" style="font-family: Lato, sans-serif;">Hãy thử sử dụng các từ khóa chung
                        chung hơn</p>
                </div>
                @endif
            </main>
        </div>
    </div>
</div>

<div class="shopee-category-section mb-4">
    <div class="shopee-section-header">
        <h2 class="shopee-section-title">Danh Mục</h2>
    </div>
    <div class="category-grid-container">
        <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 row-cols-xl-8 g-2">
            @foreach ($categories as $category)
            <div class="col">
                <a href="{{ route('products', ['categories[]' => $category->id]) }}"
                    class="category-item d-block text-center">
                    <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{ $category->name }}"
                        style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%; margin-bottom: 8px;">
                    <div class="category-item-title small">{{ $category->name }}</div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</div>
@endsection

@push('styles')
<link href="https://fonts.googleapis.com/css?family=Lato:400,700&display=swap" rel="stylesheet">
<style>
.shopee-search-page-layout,
.product-card,
.product-card * {
    font-family: 'Lato', Arial, sans-serif !important;
}

.shopee-search-page-layout {
    background: #f7f7f7;
    min-height: 100vh;
}

.sidebar-filters {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
    padding: 1.5rem 1rem;
}

.sidebar-filters .form-check-input:checked {
    background-color: #ee4d2d;
    border-color: #ee4d2d;
}

.sort-bar {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
}

.sort-bar .btn {
    border-radius: 20px;
    margin-right: 8px;
    padding: 0.35rem 1.2rem;
    font-size: 0.95rem;
    transition: background 0.2s, color 0.2s;
}

.sort-bar .btn-primary {
    color: #fff;
    background: #ee4d2d;
    border: none;
}

.sort-bar .btn-light {
    background: #fff;
    border: 1px solid #e8e8e8;
}

.product-card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
    transition: transform 0.15s, box-shadow 0.15s;
    position: relative;
    overflow: hidden;
    min-height: 320px;
}

.product-card:hover {
    transform: translateY(-4px) scale(1.02);
    box-shadow: 0 6px 24px rgba(238, 77, 45, 0.10);
    border-color: #ee4d2d;
}

.product-card__image {
    transition: transform 0.2s;
}

.product-card:hover .product-card__image {
    transform: scale(1.05);
}

.category-item {
    border-radius: 50%;
    border: 2px solid #eee;
    transition: border 0.2s, box-shadow 0.2s;
}

.category-item:hover {
    border: 2px solid #ee4d2d;
    box-shadow: 0 2px 8px rgba(238, 77, 45, 0.08);
}

.add-to-cart-btn {
    background: #ee4d2d;
    color: #fff;
    border: none;
    border-radius: 20px;
    font-size: 0.95rem;
    transition: background 0.2s, color 0.2s;
}

.add-to-cart-btn:hover,
.add-to-cart-btn:focus {
    background: #d0011b;
    color: #fff;
}
</style>
@endpush

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Auto-submit form on filter change for checkboxes
    document.querySelectorAll('.sidebar-filters .form-check-input').forEach(input => {
        input.addEventListener('change', function() {
            document.getElementById('filter-form').submit();
        });
    });
});
</script>
@endpush