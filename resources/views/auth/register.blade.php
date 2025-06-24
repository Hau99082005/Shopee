<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Shopee Clone</title>
    @vite(['resources/css/app.css'])
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
    <div class="auth-container">
        <!-- Left Brand Section -->
        <div class="auth-left">
            <img src="{{ asset('assets/images/images.png') }}" alt="Shopee Logo" class="brand-logo">
            <p class="brand-text">Nền tảng thương mại điện tử<br />yêu thích ở Đông Nam Á & Đài Loan</p>
        </div>

        <!-- Register Form Section -->
        <div class="auth-right">
            <div class="form-box">
                <h3 class="form-title">Đăng ký</h3>
                
                <form action="{{ route('register') }}" method="POST">
                    @csrf
                    <input type="text" name="phone" class="form-control" 
                           placeholder="Số điện thoại" required>
                    <button type="submit" class="btn-primary">Tiếp Theo</button>
                </form>

                <!-- Divider -->
                <div class="divider">
                    <hr><span>HOẶC</span><hr>
                </div>

                <!-- Social Register -->
                <div class="social-login">
                    <a href="#" class="social-btn social-btn--google">
                        <i class="fab fa-google"></i> Google
                    </a>
                    <a href="#" class="social-btn social-btn--facebook">
                        <i class="fab fa-facebook-f"></i> Facebook
                    </a>
                </div>

                <!-- Login Link -->
                <p class="auth-switch-link">
                    Bạn đã có tài khoản? 
                    <a href="{{ route('login') }}">Đăng nhập</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>