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
                    <a href="#" class="px-2 fw-bold text-white text-decoration-none"
                        style="font-family: 'Lato';font-size: 16px; font-weight: lighter;">Đăng Ký</a>
                    |
                    <a href="#" class="ps-2 fw-bold text-white text-decoration-none"
                        style="font-family: 'Lato';font-size: 16px; font-weight: lighter;">Đăng Nhập</a>
                </div>
            </div>
        </div>
        <div class="container-xl px-4 pt-2 pb-3">
            <div class="row align-items-center g-4">
                <div class="col-auto">
                    <a href="/">
                        <img src="{{ asset('assets/images/Shopee.svg') }}" alt="Shopee Logo" style="height: 48px;">
                    </a>
                </div>
                <div class="col">
                    <div class="bg-white rounded p-1 d-flex">
                        <input type="text" class="form-control form-control-lg border-0"
                            placeholder="Shopee bao ship 0Đ - Đăng ký ngay!"
                            style="box-shadow: none; font-size: 16px; font-family: 'Lato';">
                        <button class="btn btn-primary px-4" type="button"
                            style="background-color: #fb5533; border-color: #fb5533;">
                            <i class="fa fa-search text-white"></i>
                        </button>
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
                    <a href="#" class="text-white fs-3 position-relative">
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
            @php
            $services = [
            ['icon' => 'mã giảm giá.jpg', 'title' => 'Mã Giảm Giá'],
            ['icon' => 'suckhoe.webp', 'title' => 'Khách Hàng Thân Thiết'],
            ['icon' => 'voucher&dichvu.webp', 'title' => 'Hàng Chọn Lọc'],
            ['icon' => 'thời trang nam.webp', 'title' => 'Shopee Style Voucher 50%'],
            ['icon' => 'thethaodulic.webp', 'title' => 'Deal Hot Giá Vàng'],
            ['icon' => 'nhasach.webp', 'title' => 'Săn Ngay 100.000 Xu'],
            ];
            @endphp
            @foreach($services as $service)
            <a href="#" class="text-decoration-none text-dark">
                <img src="{{ asset('assets/images/' . $service['icon']) }}" alt="{{$service['title']}}"
                    style="width: 45px; height: 45px; object-fit: contain;">
                <div style="font-size: 0.8rem;" class="mt-2">{{ $service['title'] }}</div>
            </a>
            @endforeach
        </section>

        <section class="shopee-section">
            <div class="shopee-section-header">
                <h2 class="shopee-section-title">Danh Mục</h2>
            </div>
            <div class="category-grid-container">
                @php
                $categories = [
                ['img' => 'thời trang nam.webp', 'name' => 'Thời Trang Nam'],
                ['img' => 'điện thoại.webp', 'name' => 'Điện Thoại & Phụ Kiện'],
                ['img' => 'thiết bị điện tử.webp', 'name' => 'Thiết Bị Điện Tử'],
                ['img' => 'máy tính và laptop.webp', 'name' => 'Máy Tính & Laptop'],
                ['img' => 'máy ảnh và quay phim.webp', 'name' => 'Máy Ảnh & Máy Quay Phim'],
                ['img' => 'đồng hồ.webp', 'name' => 'Đồng Hồ'],
                ['img' => 'giaydepnam.webp', 'name' => 'Giày Dép Nam'],
                ['img' => 'thietbigiadung.webp', 'name' => 'Thiết Bị Điện Gia Dụng'],
                ['img' => 'thethaodulic.webp', 'name' => 'Thể Thao & Du Lịch'],
                ['img' => 'otovaxedep.webp', 'name' => 'Ô Tô & Xe Máy & Xe Đạp'],
                ['img' => 'thoitrangnu.webp', 'name' => 'Thời Trang Nữ'],
                ['img' => 'samsung.jpg', 'name' => 'Mẹ & Bé'],
                ['img' => 'suckhoe.webp', 'name' => 'Nhà Cửa & Đời Sống'],
                ['img' => 'suckhoe.webp', 'name' => 'Sắc Đẹp'],
                ['img' => 'giaydepnam.webp', 'name' => 'Giày Dép Nữ'],
                ['img' => 'logo.jpg', 'name' => 'Túi Ví Nữ'],
                ['img' => 'phukienvatrangsuc.webp', 'name' => 'Phụ Kiện & Trang Sức Nữ'],
                ['img' => 'bachhoaonline.webp', 'name' => 'Bách Hóa Online'],
                ['img' => 'nhasach.webp', 'name' => 'Nhà Sách Online'],
                ['img' => 'voucher&dichvu.webp', 'name' => 'Voucher & Dịch vụ'],
                ];
                @endphp
                <div class="row row-cols-10 g-0">
                    @foreach ($categories as $category)
                    <div class="col">
                        <a href="#" class="category-item">
                            <img src="{{ asset('assets/images/' . $category['img']) }}" alt="{{ $category['name'] }}">
                            <div class="category-item-title">{{ $category['name'] }}</div>
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
                        @php
                        $flash_products = [
                        ['img' => 'anh1.jpg', 'price' => '719.100', 'sold' => 50],
                        ['img' => 'anh2.jpg', 'price' => '659.948', 'sold' => 80],
                        ['img' => 'bachhoaonline.webp', 'price' => '161.000', 'sold' => 30],
                        ['img' => 'banner.jpg', 'price' => '199.000', 'sold' => 95],
                        ['img' => 'banner1.png', 'price' => '629.000', 'sold' => 10],
                        ['img' => 'banner3.jpg', 'price' => '139.000', 'sold' => 70],
                        ['img' => 'banner4.jpg', 'price' => '250.000', 'sold' => 45],
                        ];
                        @endphp
                        @foreach($flash_products as $p)
                        <div class="swiper-slide">
                            <a href="#" class="product-card text-decoration-none">
                                <div class="product-card__discount-badge"
                                    style="background-color: rgba(255,212,36,.9);">
                                    <span style="color: #ee4d2d; font-size: 0.8rem;">-{{ rand(10, 50) }}%</span>
                                    <span style="color: white; background-color: #ee4d2d; padding: 1px 3px;">GIẢM</span>
                                </div>
                                <img src="{{ asset('assets/images/' . $p['img']) }}" class="product-card__image"
                                    alt="Product">
                                <div class="product-card__body text-center">
                                    <p class="product-card__price mb-2">
                                        <span class="product-card__price-currency">₫</span>{{ $p['price'] }}
                                    </p>
                                    <div class="flash-sale-card__progress">
                                        <div class="flash-sale-card__progress-bar" style="width: {{ $p['sold'] }}%">
                                        </div>
                                        <div class="flash-sale-card__progress-text">
                                            @if($p['sold'] > 80)
                                            <i class="fas fa-fire-alt"></i> ĐANG BÁN CHÁY
                                            @else
                                            ĐÃ BÁN {{ rand(100, 1000) }}
                                            @endif
                                        </div>
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
                            @php
                            $mall_items = [
                            ['img' => 'samsung.jpg', 'text' => 'Ưu đãi đến 50%'],
                            ['img' => 'logo.jpg', 'text' => 'Mua 1 tặng 1'],
                            ['img' => 'giaydepnam.webp', 'text' => 'Mua 1 tặng 1'],
                            ['img' => 'thời trang nam.webp', 'text' => 'COOL MATE'],
                            ['img' => 'thoitrangnu.webp', 'text' => 'Mua 1 tặng 1'],
                            ['img' => 'máy ảnh và quay phim.webp', 'text' => 'Mua là có quà'],
                            ['img' => 'suckhoe.webp', 'text' => 'Quà mọi đơn'],
                            ['img' => 'thethaodulic.webp', 'text' => 'Deal từ 99K'],
                            ];
                            @endphp
                            @foreach ($mall_items as $item)
                            <div class="col">
                                <a href="#" class="shopee-mall__item p-2">
                                    <img src="{{ asset('assets/images/' . $item['img']) }}" alt="{{ $item['text'] }}">
                                    <span class="shopee-mall__item-text">{{ $item['text'] }}</span>
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
                @php
                $products = [
                ['img' => 'anh2.jpg', 'title' => 'Set bộ áo thun chữ thêu kèm quần dài chất da cá form rộng oversize
                ulzzang', 'price' => '7.900', 'sold' => '1k+', 'discount' => '40'],
                ['img' => 'anh1.jpg', 'title' => 'Thùng 200 Chiếc Khẩu trang 5D MASK LOKA', 'price' => '38.500', 'sold'
                => '12k+', 'discount' => '98'],
                ['img' => 'thời trang nam.webp', 'title' => '1 túi màng bọc thực phẩm gấu PE', 'price' => '17.172',
                'sold' => '12k+', 'discount' => '50'],
                ['img' => 'thoitrangnu.webp', 'title' => 'Set Trà Sữa Tự Pha Trân Châu Đường Đen', 'price' => '19.000',
                'sold' => '61k+', 'discount' => '30'],
                ['img' => 'phukienvatrangsuc.webp', 'title' => 'Lược gội đầu massage da đầu silicon', 'price' =>
                '39.000', 'sold' => '61k+', 'discount' => '56'],
                ['img' => 'logo.jpg', 'title' => 'Set 50 kẹp tóc dễ thương màu hồng, màu vàng', 'price' => '47.299',
                'sold' => '1k+', 'discount' => '7'],
                ];
                @endphp
                @foreach ($products as $product)
                <div class="col mb-2">
                    <a href="#" class="suggestion-card h-100">
                        <div class="suggestion-card__image-wrapper">
                            <div class="suggestion-card__fav-badge">Yêu thích</div>
                            <div class="suggestion-card__discount-badge">
                                <span class="percent">{{ $product['discount'] }}%</span>
                                <span class="label">GIẢM</span>
                            </div>
                            <img src="{{ asset('assets/images/' . $product['img']) }}" class="suggestion-card__image"
                                alt="{{ $product['title'] }}">
                        </div>
                        <div class="suggestion-card__body">
                            <h5 class="suggestion-card__title">{{ $product['title'] }}</h5>
                            <div class="suggestion-card__footer">
                                <p class="suggestion-card__price mb-0">
                                    <span class="suggestion-card__price-currency">₫</span>{{ $product['price'] }}
                                </p>
                                <p class="suggestion-card__sold mb-0">
                                    Đã bán {{ $product['sold'] }}
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
</body>

</html>