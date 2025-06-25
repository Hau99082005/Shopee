<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Mua sắm trực tuyến trên Shopee Việt Nam - Nền tảng thương mại điện tử hàng đầu.">
    <meta name="keywords" content="Shopee, mua sắm, trực tuyến, thời trang, điện tử, gia dụng">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicon-16x16.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('apple-touch-icon.png') }}">
    <link rel="manifest" href="{{ asset('site.webmanifest') }}">
    <title>Shopee Việt Nam | Mua và Bán trên ứng dụng di động hoặc website</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts'])
</head>

<body>
    <header class="bg-primary text-white sticky-top shadow-sm">
        <div class="container-xl px-4 header-top-nav">
            <div class="d-flex justify-content-between py-1">
                <div class="d-flex">
                    <a href="#" class="pe-2 text-white text-decoration-none">Kênh Người Bán</a>
                    <div class="border-start border-white opacity-40 mx-2"></div>
                    <a href="#" class="px-2 text-white text-decoration-none">Trở thành Người bán Shopee</a>
                    <div class="border-start border-white opacity-40 mx-2"></div>
                    <a href="#" class="px-2 text-white text-decoration-none">Tải ứng dụng</a>
                    <div class="border-start border-white opacity-40 mx-2"></div>
                    <div class="ps-2 d-flex align-items-center gap-1">
                        <span>Kết nối</span>
                        <a href="#" class="fab fa-facebook text-white text-decoration-none fs-6"></a>
                        <a href="#" class="fab fa-instagram text-white text-decoration-none fs-6"></a>
                    </div>
                </div>
                <div class="d-flex align-items-center">
                    <a href="#" class="px-2 text-white text-decoration-none d-flex align-items-center gap-1">
                        <i class="fa fa-bell"></i>
                        <span>Thông Báo</span>
                    </a>
                    <a href="#" class="px-2 text-white text-decoration-none d-flex align-items-center gap-1">
                        <i class="fa fa-question-circle"></i>
                        <span>Hỗ Trợ</span>
                    </a>
                    <div class="dropdown">
                        <a href="#"
                            class="px-2 text-white text-decoration-none d-flex align-items-center gap-1 dropdown-toggle"
                            data-bs-toggle="dropdown">
                            <i class="fa fa-globe"></i>
                            <span>Tiếng Việt</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end bg-transparent text-black">
                            <li><a class="dropdown-item" href="#" style="color: black;">Tiếng Việt</a></li>
                            <li><a class="dropdown-item" href="#" style="color: black;">English</a></li>
                        </ul>
                    </div>
                    <a href="{{ route('login') }}" class="px-2 fw-bold text-white text-decoration-none"
                        style="font-family: 'Lato';font-size: 16px; font-weight: lighter;">Đăng nhập</a>
                    |
                    <a href="{{ route('register') }}" class="ps-2 fw-bold text-white text-decoration-none"
                        style="font-family: 'Lato';font-size: 16px; font-weight: lighter;">Đăng ký</a>
                </div>
            </div>
        </div>
        <div class="container-xl px-4 pt-2 pb-3">
            <div class="row align-items-center g-4">
                <div class="col-auto">
                    <a href="/">
                        <img src="{{ asset('assets/images/logo1.jpg') }}" alt="Shopee Logo" style="height: 48px;">
                    </a>
                </div>
                <div class="col">
                    <div class="bg-white rounded p-1 d-flex position-relative">
                        <input type="text" class="form-control form-control-lg border-0"
                            placeholder="Shopee bao ship 0Đ - Đăng ký ngay!"
                            style="box-shadow: none; font-size: 16px; font-family: 'Lato';" id="search-input">
                        <a href='#' class="btn btn-primary px-4" type="button"
                            style="background-color: #fb5533; border-color: #fb5533;">
                            <i class="fa fa-search text-white"></i>
                        </a>
                        <div id="search-results"
                            style="position:absolute; top:100%; left:0; right:0; background:white; z-index:1000; border-radius:0 0 8px 8px; box-shadow:0 4px 16px rgba(0,0,0,0.08);">
                        </div>
                    </div>
                    <nav class="d-flex gap-3 small mt-1 header-main-nav">
                        <a href="#" class="text-white text-decoration-none">Tất Tay Freeship</a>
                        <a href="#" class="text-white text-decoration-none">Đồ Chơi</a>
                        <a href="#" class="text-white text-decoration-none">Balo</a>
                        <a href="#" class="text-white text-decoration-none">Điện Thoại</a>
                        <a href="#" class="text-white text-decoration-none">Dép</a>
                        <a href="#" class="text-white text-decoration-none">Váy</a>
                    </nav>
                </div>
                <div class="col-auto">
                    <a href="{{ route('cart') }}" class="text-white fs-3 position-relative">
                        <i class="fa fa-shopping-cart"></i>
                        <span
                            class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-white text-primary"
                            style="font-size: 16px; font-family: 'Lato';">
                            3
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <main class="container-xl mt-4">
        <section class="row g-2 mb-3">
            <div class="col-lg-8">
                <div id="heroCarousel" class="carousel slide h-100" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0"
                            class="active"></button>
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
                        <div class="carousel-item active h-100">
                            <img src="{{ asset('assets/images/banner.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 1">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner1.png') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 2">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner3.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 3">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner4.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 4">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner5.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 5">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner7.png') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 7">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner8.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 8">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner8.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 8">
                        </div>
                        <div class="carousel-item h-100">
                            <img src="{{ asset('assets/images/banner9.jpg') }}" class="d-block w-100 h-100"
                                style="object-fit: cover" alt="Banner 9">
                        </div>
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
            @foreach((collect($categoryList)->random(6, count($categoryList))) as $category)
            <a href="#" class="text-decoration-none text-dark">
                <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{$category->name}}"
                    style="width: 45px; height: 45px; object-fit: contain;">
                <div style="font-size: 0.8rem;" class="mt-2">{{ $category->name }}</div>
            </a>
            @endforeach
        </section>

        <section class="shopee-section">
            <div class="shopee-section-header">
                <h2 class="shopee-section-title">Danh Mục</h2>
            </div>
            <div class="category-grid-container">
                <div class="row row-cols-10 g-0">
                    @foreach ($categoryList as $category)
                    <div class="col">
                        <a href="#" class="category-item">
                            <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{ $category->name }}">
                            <div class="category-item-title">{{ $category->name }}</div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
        </section>

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
                            @foreach ((collect($categoryList)->random(min(8,count($categoryList)))) as $category)
                            <div class="col">
                                <a href="#" class="shopee-mall__item p-2">
                                    <img src="{{ asset('assets/images/' . $category->image) }}"
                                        alt="{{ $category->name }}">
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
                    <a href="#" class="suggestion-card h-100">
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

    </main>
    <footer class="mt-5">
        <div class="footer-top-border"></div>
        <div class="bg-light pt-5 pb-4">
            <div class="container-xl">
                <div class="row g-4 small text-muted">
                    <div class="col-6 col-md-4 col-lg">
                        <h5 class="h6 text-uppercase text-dark fw-bold mb-3">Dịch vụ khách hàng</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Trung Tâm Trợ
                                    Giúp</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Shopee Blog</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Shopee Mall</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Hướng Dẫn Mua
                                    Hàng</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Hướng Dẫn Bán
                                    Hàng</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Thanh Toán</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Shopee Xu</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Vận Chuyển</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Trả Hàng & Hoàn
                                    Tiền</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Chăm Sóc Khách
                                    Hàng</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Chính Sách Bảo
                                    Hành</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-4 col-lg">
                        <h5 class="h6 text-uppercase text-dark fw-bold mb-3">Về Shopee</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Giới Thiệu về
                                    Shopee Việt Nam</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Tuyển Dụng</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Điều Khoản
                                    Shopee</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Chính Sách Bảo
                                    Mật</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Chính Hãng</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Kênh Người
                                    Bán</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Flash Sales</a>
                            </li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Chương Trình
                                    Tiếp Thị Liên Kết Shopee</a></li>
                            <li class="mb-2"><a href="#" class="text-decoration-none text-muted">Liên Hệ với
                                    Truyền Thông</a></li>
                        </ul>
                    </div>
                    <div class="col-lg">
                        <div class="mb-4">
                            <h5 class="h6 text-uppercase text-dark fw-bold mb-3">Thanh toán</h5>
                            <div class="d-flex flex-wrap gap-2">
                                <div class="footer-payment-logo"><img
                                        src="https://down-vn.img.susercontent.com/file/d4bbea4570b93bfd5fc652ca82a262a8"
                                        alt="VISA"></div>
                                <div class="footer-payment-logo"><img
                                        src="https://down-vn.img.susercontent.com/file/a0a9062ebe19b45c1ae0506f16af5c16"
                                        alt="MasterCard"></div>
                                <div class="footer-payment-logo"><img
                                        src="https://down-vn.img.susercontent.com/file/38fd98e55806c3b2e4535c4e4a6c4c08"
                                        alt="JCB"></div>
                                <div class="footer-payment-logo"><img
                                        src="https://down-vn.img.susercontent.com/file/2c46b83d84111ddc32cfd3b5995d9281"
                                        alt="American Express"></div>
                                <div class="footer-payment-logo"><img
                                        src="https://down-vn.img.susercontent.com/file/5e3f0bee86058637ff23cfdf2e14ca09"
                                        alt="Trả góp"></div>
                                <div class="footer-payment-logo"><img
                                        src="https://down-vn.img.susercontent.com/file/9263fa8c83628f5deff55e2a90758b06"
                                        alt="ShopeePay"></div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/0217f1d345587aa0a300e69e2195c492.png" alt="SPayLater"></div>
                            </div>
                        </div>
                        <div>
                            <h5 class="h6 text-uppercase text-dark fw-bold mb-3">Đơn vị vận chuyển</h5>
                            <div class="d-flex flex-wrap gap-2">
                                <div class="footer-payment-logo"><img
                                        src="assets/images/vn-11134258-7ras8-m20rc1wk8926cf.png" alt="SPX"></div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/vn-50009109-64f0b242486a67a3d29fd4bcf024a8c6.png"
                                        alt="Giao Hàng Nhanh"></div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/59270fb2f3fbb7cbc92fca3877edde3f.png"
                                        alt="Giao Hàng Tiết Kiệm"></div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/957f4eec32b963115f952835c779cd2c.png" alt="Viettel Post">
                                </div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/0d349e22ca8d4337d11c9b134cf9fe63.png" alt="Vietnam Post">
                                </div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/3900aefbf52b1c180ba66e5ec91190e5.png" alt="J&T Express">
                                </div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/0b3014da32de48c03340a4e4154328f6.png" alt="be"></div>
                                <div class="footer-payment-logo"><img
                                        src="assets/images/vn-50009109-ec3ae587db6309b791b78eb8af6793fd.png"
                                        alt="AhaMove"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-4 col-lg">
                        <h5 class="h6 text-uppercase text-dark fw-bold mb-3">Theo dõi chúng tôi</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#"
                                    class="text-decoration-none text-muted d-flex align-items-center gap-2"><i
                                        class="fab fa-facebook-square fs-5"></i>Facebook</a></li>
                            <li class="mb-2"><a href="#"
                                    class="text-decoration-none text-muted d-flex align-items-center gap-2"><i
                                        class="fab fa-instagram fs-5"></i>Instagram</a></li>
                            <li class="mb-2"><a href="#"
                                    class="text-decoration-none text-muted d-flex align-items-center gap-2"><i
                                        class="fab fa-linkedin fs-5"></i>LinkedIn</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-4 col-lg">
                        <h5 class="h6 text-uppercase text-dark fw-bold mb-3">Tải ứng dụng Shopee</h5>
                        <div class="d-flex">
                            <img src="{{ asset('assets/images/maqr.png') }}" alt="QR Code"
                                class="img-fluid border p-1 bg-white" style="width: 100px; height: 100px;">
                            <div class="d-flex flex-column justify-content-around ms-2">
                                <a href="#"><img src="{{ asset('assets/images/app.png') }}" style="height:20px"></a>
                                <a href="#"><img src="{{ asset('assets/images/google.png') }}" style="height:20px"></a>
                                <a href="#"><img src="{{ asset('assets/images/huaweiPlay.e08496e9.png') }}"
                                        style="height:20px; width: 80px"></a>
                            </div>
                        </div>
                    </div>
                </div>
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
                            `<div style=\"padding:8px; border-bottom:1px solid #eee; cursor:pointer;\" onclick=\"window.location='/products?search='+encodeURIComponent(item.name)\"><strong>${item.name}</strong><br><span>${item.description ? item.description.substring(0, 60) : ''}</span></div>`
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