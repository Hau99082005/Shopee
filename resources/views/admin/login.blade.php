<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Mua sắm trực tuyến trên Shopee Việt Nam - Nền tảng thương mại điện tử hàng đầu.">
    <meta name="keywords" content="Shopee, mua sắm, trực tuyến, thời trang, điện tử, gia dụng">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicon-16x16.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('apple-touch-icon.png') }}">
    <link rel="manifest" href="{{ asset('site.webmanifest') }}">
    <title>Admin - Quản Lý Shopee</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts','resources/js/main.js'])
</head>

<body>
    <div class="login-page">
        <div class="login-container">
            <div class="name-details">
                <i class="uil uil-shopping-cart"></i>
                <span class="name-shoppe">Shopee Admin</span>
            </div>
            <h2>Admin Login</h2>
            <input type="text" placeholder="Username">
            <input type="password" placeholder="Password">
            <button class="action-btn"
                onclick="window.location.href='admin.html'; alert('Đăng nhập thành công!')">Login</button>
        </div>
    </div>
</body>

</html>