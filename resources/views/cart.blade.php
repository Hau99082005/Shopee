<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Giỏ hàng - Shopee</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts'])
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>

<body class="bg-gray-100">
    <header class="bg-[#ee4d2d] text-white">
        <div class="container mx-auto flex justify-between items-center py-3 px-4">
            <ul class="hidden md:flex gap-4 text-sm">
                <li><a href="#" class="hover:underline">Kênh Người Bán</a></li>
                <span>|</span>
                <li>
                    <a href="#" class="hover:underline">trở thành người bán cho shopee</a>
                </li>
                <li><a href="#" class="hover:underline">Tải Ứng Dụng</a></li>
                <span>|</span>
                <span class="flex items-center gap-1">Kết nối:
                    <i class="fab fa-facebook text-white" aria-label="Facebook"></i>
                    <i class="fab fa-instagram text-white" aria-label="Instagram"></i>
                </span>
            </ul>
            <div class="flex gap-4 text-sm">
                <a href="{{ route('register') }}" class="hover:underline">Đăng Ký</a>
                <span>|</span>
                <a href="{{ route('login') }}" class="hover:underline">Đăng Nhập</a>
            </div>
        </div>
        </div>
    </header>
    <div class="bg-white shadow-lg py-4">
        <div class="container mx-auto flex items-center gap-2 px-2">
            <div class="text-2xl font-bold text-[#ee4d2d]">
                <a href="/">
                    <img src="{{ asset('assets/images/images.png') }}" alt="Shopee Logo" style="height: 48px;">
                </a>
            </div>
            <input type="text" placeholder="Tìm sản phẩm..."
                class="flex-1 border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-[#ee4d2d]">
            <button class="bg-[#ee4d2d] text-white px-4 py-2 rounded hover:bg-orange-600"
                style="position: relative; margin-right: 200px">
                <i class="fa fa-search" class="w-[100px]" aria-hidden="true" style="font-size: 20px; font-weight: bolder; color: white;
              "></i>
            </button>
            <a class="text-[#ee4d2d] font-semibold" style="font-size: 20px;" href="#!">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </a>
        </div>
    </div>

    <div class="cart-container">
        <div class="bg-white rounded-lg shadow-md overflow-hidden mb-4">
            <div class="p-4 border-b flex items-center text-gray-700">
                <div class="w-1/2 flex items-center gap-4">
                    <input type="checkbox" class="select-all-checkbox w-5 h-5 rounded border-gray-300">
                    <span class="font-medium">Sản phẩm</span>
                </div>
                <div class="w-1/2 flex">
                    <div class="w-1/4 text-center">Đơn giá</div>
                    <div class="w-1/4 text-center">Số lượng</div>
                    <div class="w-1/4 text-center">Số tiền</div>
                    <div class="w-1/4 text-center">Thao tác</div>
                </div>
            </div>
            <div class="cart-item p-4 flex items-center">
                <div class="w-1/2 flex items-center gap-4">
                    <input type="checkbox" class="cart-item-checkbox w-5 h-5 rounded border-gray-300">
                    <img src="https://via.placeholder.com/80" alt="Product" class="product-image">
                    <div class="product-details">
                        <h3>Áo thun nam cổ tròn basic</h3>
                        <span class="product-variant">Phân loại: Trắng, L</span>
                    </div>
                </div>
                <div class="w-1/2 flex">
                    <div class="w-1/4 text-center">
                        <span class="price" data-price="159000">₫159.000</span>
                    </div>
                    <div class="w-1/4 flex justify-center">
                        <div class="quantity-control">
                            <button class="quantity-btn">-</button>
                            <input type="number" value="1" class="quantity-input">
                            <button class="quantity-btn">+</button>
                        </div>
                    </div>
                    <div class="w-1/4 text-center">
                        <span class="price" data-price="159000">₫159.000</span>
                    </div>
                    <div class="w-1/4 text-center">
                        <button class="delete-btn">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="cart-item p-4 flex items-center border-t">
                <div class="w-1/2 flex items-center gap-4">
                    <input type="checkbox" class="cart-item-checkbox w-5 h-5 rounded border-gray-300">
                    <img src="https://via.placeholder.com/80" alt="Product" class="product-image">
                    <div class="product-details">
                        <h3>Quần jean nam form regular</h3>
                        <span class="product-variant">Phân loại: Xanh đậm, 32</span>
                    </div>
                </div>
                <div class="w-1/2 flex">
                    <div class="w-1/4 text-center">
                        <span class="price" data-price="359000">₫359.000</span>
                    </div>
                    <div class="w-1/4 flex justify-center">
                        <div class="quantity-control">
                            <button class="quantity-btn">-</button>
                            <input type="number" value="1" class="quantity-input">
                            <button class="quantity-btn">+</button>
                        </div>
                    </div>
                    <div class="w-1/4 text-center">
                        <span class="price" data-price="359000">₫359.000</span>
                    </div>
                    <div class="w-1/4 text-center">
                        <button class="delete-btn">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="voucher-section">
            <div class="voucher-button">
                <i class="fas fa-ticket-alt"></i>
                <span>Chọn Voucher</span>
            </div>
            <div class="selected-voucher text-sm text-gray-500 mt-2"></div>
        </div>
        <div class="cart-summary">
            <div class="summary-row">
                <span>Tổng tiền hàng</span>
                <span>₫518.000</span>
            </div>
            <div class="summary-row">
                <span>Giảm giá voucher</span>
                <span class="voucher-discount">-₫0</span>
            </div>
            <div class="summary-total flex justify-between items-center">
                <span>Tổng thanh toán (<span class="selected-count">0</span> sản phẩm):</span>
                <span class="price">₫0</span>
            </div>
            <button class="checkout-btn mt-4">
                Mua Hàng
            </button>
        </div>
    </div>
    <div class="voucher-modal">
        <div class="voucher-content">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-lg font-medium">Chọn Voucher</h3>
                <button class="close-voucher-modal text-gray-500 hover:text-gray-700">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="voucher-list">
                <div class="voucher-item" data-code="GIAMGIA50K" data-discount="50000">
                    <div class="voucher-logo">
                        <i class="fas fa-percentage"></i>
                    </div>
                    <div class="voucher-info">
                        <h4>Giảm 50K</h4>
                        <p>Đơn tối thiểu ₫500K</p>
                    </div>
                </div>
                <div class="voucher-item" data-code="FREESHIP" data-discount="30000">
                    <div class="voucher-logo">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="voucher-info">
                        <h4>Miễn phí vận chuyển</h4>
                        <p>Giảm 30K phí vận chuyển</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="bg-white mt-10 py-6 border-t">
        <div class="container mx-auto text-center text-sm text-gray-600">
            © 2025 Shopee. Thiết kế bằng <a href="/" style="text-decoration: none; color: black;">Shopee</a>.
        </div>
    </footer>

    <script src="assets/js/main.js"></script>
</body>

</html>