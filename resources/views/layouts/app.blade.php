<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Shopee Clone')</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom CSS -->
    @vite(['resources/css/app.css'])

    @stack('styles')
</head>

<body>
    <!-- Header -->
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
                        <img src="{{ asset('assets/images/images.png') }}" alt="Shopee Logo" style="height: 48px;">
                    </a>
                </div>
                <div class="col">
                    <div class="bg-white rounded p-1 d-flex">
                        <form class="d-flex" method="GET" action="{{ route('products') }}">
                            <input type="text" class="form-control form-control-lg border-0"
                                placeholder="Shopee bao ship 0Đ - Đăng ký ngay!"
                                style="box-shadow: none; font-size: 16px; font-family: 'Lato';"
                                value="{{ request('search') }}" name="search">
                            <button class="btn btn-primary px-4" type="button"
                                style="background-color: #fb5533; border-color: #fb5533;">
                                <i class="fa fa-search text-white"></i>
                            </button>
                        </form>
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



    <!-- Main Content -->
    <main class="py-4">
        @yield('content')
    </main>

    <!-- Footer -->
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

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    @vite(['resources/js/app.ts'])

    @stack('scripts')
</body>

</html>