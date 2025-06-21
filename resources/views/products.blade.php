@extends('layouts.app')

@section('title', 'Kết quả tìm kiếm')

@section('content')
<div class="shopee-search-page-layout">
    <div class="container-fluid mt-3">
        <div class="row">
            <!-- Sidebar Filters -->
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
                                @foreach($categories ?? [] as $category)
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categories[]" value="{{ $category->id }}" id="cat-{{ $category->id }}"
                                                   @if(in_array($category->id, request('categories', []))) checked @endif>
                                            <label class="form-check-label" for="cat-{{ $category->id }}">
                                                {{ $category->name }}
                                            </label>
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                        
                        <!-- Rating Filter -->
                        <div class="filter-group mb-4">
                            <label class="form-label fw-bold">Đánh giá</label>
                             <div class="form-check">
                                <input class="form-check-input" type="radio" name="rating" id="rating-5" value="5" @if(request('rating') == 5) checked @endif>
                                <label class="form-check-label d-flex align-items-center" for="rating-5">
                                    <div class="text-warning me-1">
                                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                    </div>
                                </label>
                            </div>
                            <!-- Add other ratings similarly -->
                        </div>

                        <!-- Price Range -->
                        <div class="filter-group mb-4">
                            <label class="form-label fw-bold">Khoảng giá</label>
                            <div class="row g-2 align-items-center">
                                <div class="col-5">
                                    <input type="number" class="form-control" name="min_price" placeholder="Từ" value="{{ request('min_price') }}">
                                </div>
                                <div class="col-1 text-center">-</div>
                                <div class="col-5">
                                    <input type="number" class="form-control" name="max_price" placeholder="Đến" value="{{ request('max_price') }}">
                                </div>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100 mb-2 text-uppercase">Áp dụng</button>
                        <a href="{{ route('products') }}" class="btn btn-light w-100 border">Xóa tất cả</a>
                    </form>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="col-lg-10 col-md-9">
                <!-- Results Header -->
                <div class="shopee-section mb-3">
                    <div class="sort-bar d-flex justify-content-between align-items-center p-3">
                        <div class="d-flex align-items-center">
                            <span class="me-3 d-none d-lg-block">Sắp xếp theo</span>
                            <a href="{{ route('products', array_merge(request()->query(), ['sort' => 'relevance'])) }}" class="btn btn-sm {{ request('sort', 'relevance') == 'relevance' ? 'btn-primary' : 'btn-light' }}">Liên quan</a>
                            <a href="{{ route('products', array_merge(request()->query(), ['sort' => 'created_at'])) }}" class="btn btn-sm {{ request('sort') == 'created_at' ? 'btn-primary' : 'btn-light' }}">Mới nhất</a>
                            <a href="{{ route('products', array_merge(request()->query(), ['sort' => 'sales'])) }}" class="btn btn-sm {{ request('sort') == 'sales' ? 'btn-primary' : 'btn-light' }}">Bán chạy</a>
                            <div class="dropdown">
                                <a class="btn btn-sm btn-light dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Giá
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="{{ route('products', array_merge(request()->query(), ['sort' => 'price', 'order' => 'asc'])) }}">Giá: Thấp đến Cao</a></li>
                                    <li><a class="dropdown-item" href="{{ route('products', array_merge(request()->query(), ['sort' => 'price', 'order' => 'desc'])) }}">Giá: Cao đến Thấp</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="d-flex align-items-center">
                            <small class="text-muted">
                               <span class="text-primary">{{ $products->currentPage() }}</span>/{{ $products->lastPage() }}
                            </small>
                            <div class="ms-2 btn-group">
                                <a href="{{ $products->previousPageUrl() }}" class="btn btn-sm btn-outline-secondary {{ $products->onFirstPage() ? 'disabled' : '' }}"><i class="fas fa-chevron-left"></i></a>
                                <a href="{{ $products->nextPageUrl() }}" class="btn btn-sm btn-outline-secondary {{ !$products->hasMorePages() ? 'disabled' : '' }}"><i class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Products Grid -->
                @if(isset($products) && $products->count() > 0)
                    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-2">
                        @foreach($products as $product)
                            <div class="col">
                                <a href="#" class="product-card text-decoration-none">
                                    <div class="product-card__image-wrapper">
                                        <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="product-card__image">
                                    </div>

                                    <div class="product-card__body">
                                        <div class="product-card__title">
                                            {{ $product->name }}
                                        </div>
                                        <div class="d-flex align-items-center mt-2">
                                            <div class="product-card__price">
                                                <span class="product-card__price-currency">₫</span>{{ number_format($product->price, 0, ',', '.') }}
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-1">
                                            <div class="d-flex align-items-center">
                                                <div class="text-warning" style="font-size: 0.7rem;">
                                                    <i class="fas fa-star"></i> {{ rand(45,50)/10 }}
                                                </div>
                                                <div class="vr mx-1"></div>
                                                <div class="product-card__sold">
                                                    Đã bán {{ round(rand(100, 5000)/100, 1) }}k
                                                </div>
                                            </div>
                                            <div class="product-card__location">Hà Nội</div>
                                        </div>
                                    </div>

                                    <!-- Badges -->
                                    <div class="product-card__fav-plus-badge">
                                        <span>Yêu thích+</span>
                                    </div>
                                    <div class="product-card__discount-badge">
                                        <span class="percent">{{ rand(10, 50) }}%</span>
                                        <span class="label">GIẢM</span>
                                    </div>
                                </a>
                            </div>
                        @endforeach
                    </div>

                    <!-- Pagination -->
                    <div class="d-flex justify-content-center mt-4">
                        {{ $products->appends(request()->query())->links() }}
                    </div>
                @else
                    <div class="text-center py-5">
                        <img src="{{ asset('assets/images/search-not-found.png') }}" alt="Không tìm thấy" style="width:100px; height:100px;">
                        <h5 class="text-muted mt-3">Không tìm thấy kết quả nào</h5>
                        <p class="text-muted small">Hãy thử sử dụng các từ khóa chung chung hơn</p>
                    </div>
                @endif
            </main>
        </div>
    </div>
</div>
@endsection

@push('styles')
<style>
.shopee-search-page-layout {
    background-color: #f5f5f5;
}
/* Sidebar Filters */
.sidebar-filters .form-check-input:checked {
    background-color: var(--shopee-orange);
    border-color: var(--shopee-orange);
}
.sidebar-filters .form-check-label {
    font-size: 0.875rem;
}

/* Sort Bar */
.sort-bar {
    background-color: rgba(0,0,0,.03);
}
.sort-bar .btn {
    border-radius: 2px;
    margin-right: 8px;
    padding: 0.35rem 1rem;
    font-size: 0.875rem;
}
.sort-bar .btn-primary {
    color: #fff;
    background-color: var(--shopee-orange);
}
.sort-bar .btn-light {
    background-color: #fff;
    border: 1px solid #e8e8e8;
}

/* Product Card */
.product-card {
    display: block;
    background-color: #fff;
    transition: all 0.1s ease;
    position: relative;
    border: 1px solid #fff;
}
.product-card:hover {
    transform: translateY(-1px);
    border-color: var(--shopee-orange);
    box-shadow: 0 0 0.8125rem 0 rgba(0,0,0,.05);
}
.product-card__image-wrapper {
    padding-top: 100%;
}
.product-card__body {
    padding: 0.5rem;
}
.product-card__title {
    font-size: 0.75rem;
    height: 2.25rem; /* 2 lines */
}
.product-card__price {
    font-size: 1rem;
}
.product-card__sold, .product-card__location {
    font-size: 0.75rem;
    color: rgba(0,0,0,.54);
}
.product-card__location {
    text-align: right;
}

/* Badges */
.product-card__fav-plus-badge {
    position: absolute;
    top: 10px;
    left: 0px;
    background-color: var(--shopee-orange);
    color: white;
    font-size: 0.6rem;
    font-weight: 500;
    padding: 2px 4px;
    border-top-right-radius: 2px;
    border-bottom-right-radius: 2px;
    z-index: 2;
}
.product-card__fav-plus-badge::after{
    content:"";
    position: absolute;
    left: 0;
    bottom: -2.5px;
    border-top: 3px solid var(--shopee-orange);
    border-left: 3px solid transparent;
    filter: brightness(60%);
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
