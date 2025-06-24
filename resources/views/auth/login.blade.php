<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Shopee Clone</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts'])
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>

<body class="login-page-body">
    <div class="container-fluid h-100">
        <div class="row h-100">
            <!-- Left Brand Section -->
            <div class="col-md-7 d-none d-md-flex login-bg-left">
                <div class="text-center text-white">
                    <img src="{{ asset('assets/images/images.png') }}" alt="Shopee Logo" class="brand-logo">
                    <h2 class="brand-title">Nền tảng thương mại điện tử</h2>
                    <p class="brand-subtitle">yêu thích ở Đông Nam Á & Đài Loan</p>
                </div>
            </div>

            <!-- Login Form Section -->
            <div class="col-md-5 d-flex align-items-center justify-content-center">
                <div class="login-form-container">
                    <!-- Form Header -->
                    <div class="form-header">
                        <h4 class="form-title">Đăng nhập</h4>
                        <a href="#" class="qr-btn">QR</a>
                    </div>

                    <!-- Login Form -->
                    <form action="{{ route('login') }}" method="POST">
                        @csrf
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" 
                                   placeholder="Email/SĐT/Tên đăng nhập" required>
                        </div>
                        <div class="input-group">
                            <input type="password" name="password" class="form-control" 
                                   placeholder="Mật khẩu" required>
                        </div>
                        <button type="submit" class="btn-login">ĐĂNG NHẬP</button>
                    </form>

                    <!-- Helper Links -->
                    <div class="helper-links">
                        <a href="#" class="helper-link">Quên mật khẩu</a>
                        <a href="#" class="helper-link">SMS</a>
                    </div>

                    <!-- Divider -->
                    <div class="divider">
                        <hr><span>HOẶC</span><hr>
                    </div>

                    <!-- Social Login -->
                    <div class="social-login">
                        <a href="#" class="social-btn social-btn--google">
                            <i class="fab fa-google"></i> Google
                        </a>
                        <a href="#" class="social-btn social-btn--facebook">
                            <i class="fab fa-facebook-f"></i> Facebook
                        </a>
                    </div>

                    <!-- Register Link -->
                    <p class="register-link">
                        Bạn mới biết đến Shopee? 
                        <a href="{{ route('register') }}">Đăng ký</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>