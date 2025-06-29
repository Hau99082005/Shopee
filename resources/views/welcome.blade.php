@extends('layouts.app')

@section('content')
<main class="container-xl mt-4">
    <section class="row g-2 mb-3">
        <div class="col-lg-8">
            <div id="heroCarousel" class="carousel slide h-100" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="4"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="5"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="6"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="7"></button>
                    <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="8"></button>
                </div>
                <div class="carousel-inner h-100 rounded-1">
                    @foreach ($bannerList as $key => $banners)
                    <div class="carousel-item {{ $key == 0 ? 'active' : '' }} h-100">
                        <img src="{{ asset('assets/images/'.$banners->image) }}" class="d-block w-100 h-100"
                            style="object-fit: cover" alt="{{ $banners->title }}">
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="col-lg-4 d-flex flex-column gap-2">
            <div class="h-50">
                <img src="{{ asset('assets/images/banner4.jpg') }}" class="img-fluid rounded-1 h-100 w-100"
                    style="object-fit: cover" alt="Sub Banner 1">
            </div>
            <div class="h-50">
                <img src="{{ asset('assets/images/banner5.jpg') }}" class="img-fluid rounded-1 h-100 w-100"
                    style="object-fit: cover" alt="Sub Banner 2">
            </div>
        </div>
    </section>

    <section class="bg-white rounded d-flex justify-content-around p-3 text-center">
        @foreach((collect($categories)->random(6, count($categories))) as $category)
        <a href="{{ route('products', ['categories[]' => $category->id]) }}" class="text-decoration-none text-dark">
            <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{$category->name}}"
                style="width: 45px; height: 45px; object-fit: contain;">
            <div style="font-size: 0.8rem;" class="mt-2">{{ $category->name }}</div>
        </a>
        @endforeach
    </section>
    <section class="shopee-section bg-white py-4 rounded shadow-sm position-relative">
        <div class="shopee-section-header mb-3 px-3">
            <h2 class="shopee-section-title text-lg fw-semibold text-dark">Danh Mục</h2>
        </div>

        <button id="scrollLeft"
            class="btn btn-outline-secondary rounded-circle position-absolute top-50 start-0 translate-middle-y z-3 d-flex align-items-center justify-content-center shadow-sm fs-5"
            style="width: 40px; height: 40px; font-weight: bold;">
            &lt;
        </button>
        <button id="scrollRight"
            class="btn btn-outline-secondary rounded-circle position-absolute top-50 end-0 translate-middle-y z-3 d-flex align-items-center justify-content-center shadow-sm fs-5"
            style="width: 40px; height: 40px; font-weight: bold;">
            &gt;
        </button>
        <div class="px-5">
            <div id="categoryScrollContainer" class="d-flex flex-nowrap"
                style="scroll-behavior: smooth; overflow-x: auto; -ms-overflow-style: none; scrollbar-width: none;">
                <div class="d-flex flex-column flex-shrink-0" style="gap: 1rem;">
                    @foreach ($categories->chunk(ceil($categories->count() / 2)) as $chunk)
                    <div class="d-flex flex-nowrap" style="gap: 1rem;">
                        @foreach ($chunk as $category)
                        <div class="text-center flex-shrink-0" style="width: 100px;">
                            <a href="{{ route('products', ['categories[]' => $category->id]) }}"
                                class="category-item text-decoration-none">
                                <img src="{{ asset('assets/images/' . $category->image) }}"
                                    class="img-fluid rounded-circle mx-auto d-block mb-1 border"
                                    style="width:70px; height:70px; object-fit:cover;" alt="{{ $category->name }}">
                                <div class="category-item-title small text-dark">{{ $category->name }}</div>
                            </a>
                        </div>
                        @endforeach
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>

    <script>
    const container = document.getElementById('categoryScrollContainer');
    document.getElementById('scrollLeft').addEventListener('click', () => {
        container.scrollBy({
            left: -400,
            behavior: 'smooth'
        });
    });

    document.getElementById('scrollRight').addEventListener('click', () => {
        container.scrollBy({
            left: 400,
            behavior: 'smooth'
        });
    });
    </script>


    <section class="shopee-section">
        <div class="shopee-section-header align-items-baseline">
            <div class="d-flex align-items-center">
                <h2 class="shopee-section-title me-2" style="color: #d0011b; font-weight: 700;">
                    <img src="{{asset('assets/images/flash-sale.png')}}" alt="Flash Sale" height="24" class="me-1">
                    FLASH SALE
                </h2>
                <div id="countdown" class="countdown d-flex gap-1 text-center">
                    <span class="bg-dark text-white p-1 rounded-1 small hours">00</span>
                    <span class="fw-bold">:</span>
                    <span class="bg-dark text-white p-1 rounded-1 small minutes">00</span>
                    <span class="fw-bold">:</span>
                    <span class="bg-dark text-white p-1 rounded-1 small seconds">00</span>
                </div>
            </div>
            <a href="#" class="shopee-view-all">Xem tất cả <i class="fas fa-chevron-right small"></i></a>
        </div>

        <div class="p-3 position-relative">
            <div class="swiper flash-sale-swiper">
                <div class="swiper-wrapper">
                    @foreach((collect($productList)->random(min(10, count($productList)))) as $products)
                    @php
                    $discountPercent = 0;
                    if (isset($products->price_old) && $products->price_old > $products->price) {
                    $discountPercent = round((($products->price_old - $products->price) / $products->price_old) *
                    100);
                    }
                    @endphp
                    <div class="swiper-slide d-flex justify-content-center align-items-stretch">
                        <a href="#"
                            class="product-card text-decoration-none shadow-sm bg-white rounded-4 p-3 d-flex flex-column align-items-center"
                            style="min-width:180px; max-width:210px; margin:0 auto; transition:box-shadow 0.2s;">

                            @if($discountPercent > 0)
                            <div class="product-card__discount-badge position-absolute top-0 end-0 m-2 px-2 py-1 rounded-2 fw-bold"
                                style="background:rgba(255,212,36,.95); color:#ee4d2d; font-size:0.9rem; z-index:2; box-shadow:0 2px 8px rgba(238,77,45,0.08);">
                                -{{ $discountPercent }}%
                            </div>
                            @endif

                            <img src="{{ asset('assets/images/' . $products->image) }}"
                                class="product-card__image mb-2 rounded-3" alt="Product"
                                style="width:120px; height:120px; object-fit:cover; box-shadow:0 2px 8px rgba(0,0,0,0.06);">

                            <div class="product-card__body text-center w-100">
                                <p class="product-card__price mb-2 fw-bold text-danger" style="font-size:1.2rem;">
                                    <span class="product-card__price-currency">₫</span>{{ $products->price }}
                                </p>

                                @if(isset($products->price_old) && $products->price_old > $products->price)
                                <p class="text-muted small mb-1" style="text-decoration: line-through;">
                                    ₫{{ $products->price_old }}
                                </p>
                                @endif

                                <div
                                    class="flash-sale-card__progress-text small text-secondary text-center align-items-center justify-center">
                                    @if($products->stock > 80)
                                    <i class="fas fa-fire-alt text-warning"></i> ĐANG BÁN CHÁY
                                    @else
                                    ĐÃ BÁN {{ rand(100, 1000) }}
                                    @endif
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>

            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </section>

    <section class="shopee-section">
        <div class="shopee-section-header">
            <div class="d-flex align-items-center">
                <h2 class="shopee-section-title me-3" style="border-right: 1px solid #ccc; padding-right: 1rem;">
                    SHOPEE MALL</h2>
                <a href="#" class="text-dark text-decoration-none small d-flex align-items-center me-3"><i
                        class="fas fa-undo-alt text-danger me-2"></i>Trả Hàng Miễn Phí 15 Ngày</a>
                <a href="#" class="text-dark text-decoration-none small d-flex align-items-center me-3"><i
                        class="fas fa-check-circle text-danger me-2"></i>Hàng Chính Hãng 100%</a>
                <a href="#" class="text-dark text-decoration-none small d-flex align-items-center"><i
                        class="fas fa-truck text-danger me-2"></i>Miễn Phí Vận Chuyển</a>
            </div>
            <a href="#" class="shopee-view-all">Xem tất cả <i class="fas fa-chevron-right small"></i></a>
        </div>
        <div class="p-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <a href="#">
                        <img src="{{ asset('assets/images/banner7.png') }}" alt="Shopee Mall Banner"
                            class="img-fluid h-100" style="object-fit: cover;">
                    </a>
                </div>
                <div class="col-md-8">
                    <div class="row row-cols-4 g-0">
                        @foreach ((collect($categories)->random(min(8,count($categories)))) as $category)
                        <div class="col">
                            <a href="{{ route('products', ['categories[]' => $category->id]) }}"
                                class="shopee-mall__item p-2">
                                <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{ $category->name }}">
                                <span class="shopee-mall__item-text">{{ $category->name }}</span>
                            </a>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="shopee-section-header"
        style="background: white; margin-top: 1.25rem; border-top-left-radius: 4px; border-top-right-radius: 4px;">
        <h2 class="shopee-section-title">GỢI Ý HÔM NAY</h2>
    </div>
    <div class="p-3 bg-white">
        <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 g-2">
            @foreach ($productList as $products)
            <div class="col mb-2">
                <a href="{{ route('products.detail', ['id' => $products->id]) }}" class="suggestion-card h-100">
                    <div class="suggestion-card__image-wrapper">
                        <div class="suggestion-card__fav-badge">Yêu thích</div>
                        <div class="suggestion-card__discount-badge">
                            <span class="percent">{{ $products->discount ?? 0 }}%</span>
                            <span class="label">GIẢM</span>
                        </div>
                        <img src="{{ asset('assets/images/' . $products->image) }}" class="suggestion-card__image"
                            alt="{{ $products->name }}">
                    </div>
                    <div class="suggestion-card__body">
                        <h5 class="suggestion-card__title">{{ $products->name }}</h5>
                        <div class="suggestion-card__footer">
                            <p class="suggestion-card__price mb-0">
                                <span class="suggestion-card__price-currency">₫</span>{{ $products->price }}
                            </p>
                            <p class="suggestion-card__sold mb-0">
                                Đã bán {{ $products->stock }}
                            </p>
                        </div>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>

    <div class="bg-light border-top py-3">
        <div class="container-xl">
            <div class="d-flex justify-content-between small text-muted">
                <p class="mb-0">© 2025 Shopee. Tất cả các quyền được bảo lưu.</p>
                <p class="mb-0">Quốc gia & Khu vực:
                    <a href="#" class="text-decoration-none text-muted">Singapore</a> |
                    <a href="#" class="text-decoration-none text-muted">Indonesia</a> |
                    <a href="#" class="text-decoration-none text-muted">Thái Lan</a> |
                    <a href="#" class="text-decoration-none text-muted">Malaysia</a> |
                    <a href="#" class="text-decoration-none text-muted">Việt Nam</a> |
                    <a href="#" class="text-decoration-none text-muted">Philippines</a> |
                    <a href="#" class="text-decoration-none text-muted">Brazil</a> |
                    <a href="#" class="text-decoration-none text-muted">México</a> |
                    <a href="#" class="text-decoration-none text-muted">Colombia</a> |
                    <a href="#" class="text-decoration-none text-muted">Chile</a> |
                    <a href="#" class="text-decoration-none text-muted">Đài Loan</a>
                </p>
            </div>
        </div>
    </div>

    <div class="footer-bottom py-5">
        <div class="container-xl small text-center text-muted">
            <div class="footer-policy-link-list mb-4" style="text-decoration: none;">
                <a href="#" style="text-decoration: none; color: black; font-size: 14px; font-family: 'Lato';
                    font-weight: lighter;">CHÍNH
                    SÁCH BẢO MẬT</a>
                <a href="#" style="text-decoration: none; color: black; font-size: 14px; font-family: 'Lato';
                    font-weight: lighter;">QUY CHẾ HOẠT ĐỘNG</a>
                <a href="#" style="text-decoration: none; color: black; font-size: 14px; font-family: 'Lato';
                    font-weight: lighter;">CHÍNH SÁCH VẬN CHUYỂN</a>
                <a href="#" style="text-decoration: none; color: black; font-size: 14px; font-family: 'Lato';
                    font-weight: lighter;">CHÍNH SÁCH TRẢ HÀNG VÀ HOÀN TIỀN</a>
            </div>

            <div class="d-flex justify-content-center align-items-center mb-4">
                <a href="#" class="mx-3">
                    <img src="assets/images/download.png" alt="Đã đăng ký" style="height: 48px;">
                </a>
                <a href="#" class="mx-3">
                    <img src="assets/images/download.png" alt="Đã đăng ký" style="height: 48px;">
                </a>
                <a href="#" class="mx-3">
                    <img src="assets/images/download.png" alt="Đã thông báo" style="height: 48px;">
                </a>
            </div>

            <p class="mb-1">Công ty TNHH Shopee</p>
            <p class="mb-1">Địa chỉ: Tầng 4-5-6, Tòa nhà Capital Place, số 29 đường Liễu Giai, Phường Ngọc Khánh,
                Quận Ba Đình, Thành phố Hà Nội, Việt Nam. Tổng đài hỗ trợ: 19001221 - Email: cskh@hotro.shopee.vn
            </p>
            <p class="mb-1">Chịu Trách Nhiệm Quản Lý Nội Dung: Nguyễn Đức Trí - Điện thoại liên hệ: 024 73081221
                (ext 4678)</p>
            <p class="mb-1">Mã số doanh nghiệp: 0106773786 do Sở Kế hoạch & Đầu tư TP Hà Nội cấp lần đầu ngày
                10/02/2015</p>
            <p class="mb-0">© 2015 - Bản quyền thuộc về Công ty TNHH Shopee</p>
        </div>
    </div>
    </footer>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('search-input');
        const resultsDiv = document.getElementById('search-results');

        function showResults(keyword) {
            if (keyword.length < 1) {
                resultsDiv.innerHTML = '';
                resultsDiv.style.display = 'none';
                return;
            }
            fetch(`/search?q=${encodeURIComponent(keyword)}`)
                .then(res => res.json())
                .then(data => {
                    if (!Array.isArray(data) || data.length === 0) {
                        resultsDiv.innerHTML = '<p style="padding:8px">Không tìm thấy sản phẩm.</p>';
                    } else {
                        resultsDiv.innerHTML = data.map(item =>
                            `<div style="padding:8px; border-bottom:1px solid #eee; cursor:pointer; display:flex; align-items:center;" onclick="window.location='/products/${item.id}/detail'">
                                <img src="/assets/images/${item.image}" alt="${item.name}" style="width:48px;height:48px;object-fit:cover;margin-right:12px;">
                                <div>
                                    <div style="font-weight:500; color:#222; font-family:'Lato',sans-serif; font-size:16px;">${item.name}</div>
                                    <div style="font-size:13px;color:#888; font-family:'Lato',sans-serif;">${item.description ? item.description.substring(0, 60) : ''}</div>
                                </div>
                            </div>`
                        ).join('');
                    }
                    resultsDiv.style.display = 'block';
                });
        }
        if (searchInput) {
            searchInput.addEventListener('input', function() {
                showResults(this.value.trim());
            });
            searchInput.addEventListener('blur', function() {
                setTimeout(() => {
                    resultsDiv.style.display = 'none';
                }, 200);
            });
        }
    });
    </script>
    </body>

    </html>