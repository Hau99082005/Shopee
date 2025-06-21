<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Mua sắm trực tuyến trên Shopee với đa dạng sản phẩm từ thời trang, điện tử đến gia dụng.">
    <meta name="keywords" content="Shopee, mua sắm, thương mại điện tử, Việt Nam">
    <title>Shopee Giao Diện</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts'])
</head>

<body class="bg-gray-100 font-sans">
    <header class="bg-[#ee4d2d] text-white text-sm">
        <div class="max-w-screen-xl mx-auto flex justify-between items-center px-4 py-2">
            <div class="hidden md:flex space-x-3">
                <a href="#" aria-label="Truy cập kênh người bán" class="hover:underline">Kênh Người Bán</a>
                <span>|</span>
                <a href="#" aria-label="Đăng ký trở thành người bán" class="hover:underline">Trở thành Người bán</a>
                <span>|</span>
                <a href="#" aria-label="Tải ứng dụng Shopee" class="hover:underline">Tải ứng dụng</a>
                <span>|</span>
                <span class="flex items-center gap-1">Kết nối:
                    <i class="fab fa-facebook text-white" aria-label="Facebook"></i>
                    <i class="fab fa-instagram text-white" aria-label="Instagram"></i>
                </span>
            </div>
            <div class="flex items-center space-x-3">
                <a href="./login-signup/login-signup.html" aria-label="Đăng nhập tài khoản" style="text-decoration: none;" class="hover:underline">Đăng Nhập</a>
            </div>
        </div>
    </header>
    <div class="shadow" style="background: linear-gradient(#ee4d2d,#ff7337);">
        <div class="max-w-screen-xl mx-auto px-4 py-4">
            <div class="flex items-center gap-4 flex-wrap">
                <img src="{{ asset('assets/images/download.jpg') }}" width="100" height="100" />
                <div class="text-white text-3xl font-extrabold">Shopee</div>
                <div class="flex-1">
                    <div class="relative w-full h-10">
                        <input type="text" placeholder="Tìm sản phẩm, thương hiệu và tên shop..." class="w-full h-full border border-gray-300 rounded-sm pl-4 pr-10 text-sm focus:outline-none focus:ring-2 focus:ring-orange-500" aria-label="Tìm kiếm sản phẩm" />
                        <button class="absolute right-0 top-0 h-full px-4 bg-[#ee4d2d] text-white rounded-r-sm hover:bg-gray-100 flex items-center justify-center transition" aria-label="Tìm kiếm">
            <i class="fa fa-search"></i>
          </button>
                    </div>
                    <div class="flex flex-wrap gap-2 mt-1 text-xs text-white">
                        <a href="#" class="hover:text-yellow-300 transition">Áo khoác nữ</a>
                        <a href="#" class="hover:text-yellow-300 transition">Dép quai ngang</a>
                        <a href="#" class="hover:text-yellow-300 transition">iPhone 13</a>
                        <a href="#" class="hover:text-yellow-300 transition">Tai nghe bluetooth</a>
                        <a href="#" class="hover:text-yellow-300 transition">Quần jeans nam</a>
                        <a href="#" class="hover:text-yellow-300 transition">Kem chống nắng</a>
                    </div>
                </div>
                <a href="cart.html" class="text-white text-2xl relative" aria-label="Giỏ hàng">
                    <i class="fa fa-shopping-cart"></i>
                    <span class="absolute -top-2 -right-2 text-white text-xs font-bold w-5 h-5 flex items-center justify-center rounded-full border border-white bg-[#ee4d2d]" id="cart-count">3</span>
                </a>
            </div>
        </div>
    </div>


    <section class="py-5 bg-white">
        <div class="container">
            <div class="row g-3">
                <div class="col-lg-8">
                    <div id="shopeeBanner" class="carousel slide h-100" data-bs-ride="carousel">

                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="3" aria-label="Slide 4"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="4" aria-label="Slide 5"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="5" aria-label="Slide 6"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="6" aria-label="Slide 7"></button>
                            <button type="button" data-bs-ta rget="#shopeeBanner" data-bs-slide-to="7" aria-label="Slide 8"></button>
                            <button type="button" data-bs-target="#shopeeBanner" data-bs-slide-to="8" aria-label="Slide 9"></button>
                        </div>
                        <div class="carousel-inner h-100">
                            <div class="carousel-item active">
                                <img src="{{ asset('assets/images/banner.jpg') }}" class="d-block w-100 rounded" alt="Banner 1">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner1.png') }}" class="d-block w-100 rounded" alt="Banner 2">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner3.jpg') }}" class="d-block w-100 rounded" alt="Banner 3">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner4.jpg') }}" class="d-block w-100 rounded" alt="Banner 4">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner5.jpg') }}" class="d-block w-100 rounded" alt="Banner 5">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner7.png') }}" class="d-block w-100 rounded" alt="Banner 6">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner8.jpg') }}" class="d-block w-100 rounded" alt="Banner 7">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner8.jpg') }}" class="d-block w-100 rounded" alt="Banner 8">
                            </div>
                            <div class="carousel-item">
                                <img src="{{ asset('assets/images/banner9.jpg') }}" class="d-block w-100 rounded" alt="Banner 9">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#shopeeBanner" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#shopeeBanner" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
                    </div>
                </div>
                <div class="col-lg-4 d-flex flex-column gap-3">
                    <img src="{{ asset('assets/images/anh1.jpg') }}" class="img-fluid rounded" alt="Banner nhỏ trên">
                    <img src="{{ asset('assets/images/anh2.jpg') }}" class="img-fluid rounded" alt="Banner nhỏ dưới">
                </div>
            </div>
        </div>
    </section>


    <section class="container mt-4">
        <div class="bg-white rounded shadow p-4">
            <h2 class="mb-4 fw-semibold text-gray-800">Danh Mục Sản Phẩm</h2>
            <div class="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-5 lg:grid-cols-10 gap-4">
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/thời trang nam.webp') }}" alt="Thời Trang Nam" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Thời trang nam</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/điện thoại.webp') }}" alt="Điện Thoại" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Điện Thoại & Phụ Kiện</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/thiết bị điện tử.webp') }}" alt="Thiết Bị Điện Tử" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Thiết bị điện tử</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/máy tính và laptop.webp') }}" alt="Máy Tính & Laptop" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Máy tính & Laptop</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/máy ảnh và quay phim.webp') }}" alt="Máy Ảnh & Quay Phim" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Máy ảnh và quay phim</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/đồng hồ.webp') }}" alt="Đồng Hồ" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Đồng hồ</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/giaydepnam.webp') }}" alt="Giày Dép Nam" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Giày dép nam</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/thietbigiadung.webp') }}" alt="Thiết Bị Gia Dụng" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Thiết bị đồ gia dụng</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/thethaodulic.webp') }}" alt="Thể Thao & Du Lịch" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Thể Thao & Du lịch</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/otovaxedep.webp') }}" alt="Ô tô & Xe Máy" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Ô tô & xe máy & xe đạp</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/voucher&dichvu.webp') }}" alt="Ô tô & Xe Máy" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Voucher và dịch vụ</span>
                </div>
                <div class="flex flex-col items-center group cursor-pointer">
                    <div class="w-16 h-16 rounded-full bg-gray-100 flex items-center justify-center mb-2 overflow-hidden border group-hover:shadow-lg transition">
                        <img src="{{ asset('assets/images/suckhoe.webp') }}" alt="Ô tô & Xe Máy" class="w-12 h-12 object-contain" />
                    </div>
                    <span class="text-xs text-center text-gray-700 group-hover:text-[#ee4d2d]">Sức khoẻ</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Flash Sale Section -->
    <section class="max-w-screen-xl mx-auto mt-6 px-4">
        <div class="bg-white rounded shadow p-4">
            <div class="flex items-center justify-between mb-4">
                <div class="flex items-center gap-2">
                    <img src="{{ asset('assets/images/flashsale.png') }}" alt="Flash Sale" class="h-8" />
                    <h2 class="text-lg font-semibold text-gray-800">FLASH SALE</h2>
                </div>
                <div class="flex items-center space-x-2">
                    <span class="text-sm text-gray-600">Kết thúc trong</span>
                    <div class="bg-red-500 text-white px-2 py-1 rounded text-sm font-medium">02</div>
                    <span>:</span>
                    <div class="bg-red-500 text-white px-2 py-1 rounded text-sm font-medium">45</div>
                    <span>:</span>
                    <div class="bg-red-500 text-white px-2 py-1 rounded text-sm font-medium">33</div>
                </div>
            </div>
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                <!-- Flash Sale Items -->
                <div class="border rounded p-2 hover:shadow-lg transition">
                    <div class="relative">
                        <img src="https://via.placeholder.com/150" alt="Product" class="w-full h-32 object-cover mb-2" />
                        <div class="absolute top-0 right-0 bg-red-500 text-white text-xs px-1 py-0.5 rounded-bl">-50%</div>
                    </div>
                    <div class="text-red-500 font-bold text-lg">₫199.000</div>
                    <div class="text-gray-500 text-sm line-through">₫399.000</div>
                    <div class="mt-2">
                        <div class="w-full bg-gray-200 rounded-full h-1.5">
                            <div class="bg-red-500 h-1.5 rounded-full" style="width: 70%"></div>
                        </div>
                        <div class="text-xs text-gray-500 mt-1">Đã bán 70%</div>
                    </div>
                </div>
                <!-- Repeat similar structure for more items -->
            </div>
        </div>
    </section>

    <!-- Featured Products -->
    <section class="max-w-screen-xl mx-auto mt-6 px-4">
        <div class="bg-white rounded shadow p-4">
            <h2 class="text-lg font-semibold mb-4 text-gray-800">Sản Phẩm Nổi Bật</h2>
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4">
                <div class="bg-white rounded shadow p-2 hover:shadow-lg transition">
                    <div class="relative">
                        <img src="https://via.placeholder.com/200" alt="Product" class="w-full h-40 object-cover mb-2" />
                        <div class="absolute top-0 right-0 bg-red-500 text-white text-xs px-1 py-0.5 rounded-bl">-20%</div>
                    </div>
                    <h3 class="text-sm font-medium line-clamp-2 h-10">Áo thun nam cổ tròn chất liệu cotton 100%</h3>
                    <div class="flex items-center justify-between mt-2">
                        <div class="text-red-500 font-bold">₫150.000</div>
                        <div class="text-xs text-gray-500">Đã bán 1.2k</div>
                    </div>
                    <div class="mt-2">
                        <div class="flex items-center">
                            <div class="text-yellow-400 text-xs">★★★★★</div>
                            <span class="text-xs text-gray-500 ml-1">(4.9)</span>
                        </div>
                    </div>
                </div>
                <!-- Repeat similar structure for more items -->
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-white mt-10 py-6 border-t">
        <div class="max-w-screen-xl mx-auto text-center text-sm text-gray-600">
            © 2025 Shopee Giao Diện. Thiết kế mô phỏng bằng Tailwind CSS.
        </div>
    </footer>
</body>

</html>
