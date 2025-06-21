<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập tài khoản - Shopee Clone</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts'])
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
    body.login-page-body {
        background-color: #f5f5f5;
    }

    .login-bg-left {
        background: linear-gradient(to right, #f53d2d, #f63);
        align-items: center;
        justify-content: center;
    }

    .login-bg-left img {
        width: 160px;
        margin-bottom: 20px;
    }

    .login-form-container {
        width: 100%;
        max-width: 360px;
        padding: 40px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
    }

    .btn-login {
        background-color: #f53d2d;
        border-color: #f53d2d;
    }

    .btn-login:hover {
        background-color: #c32f1c;
        border-color: #c32f1c;
    }

    .social-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }

    .divider-or {
        display: flex;
        align-items: center;
        text-align: center;
        margin-top: 20px;
    }

    .divider-or hr {
        flex: 1;
        border: none;
        height: 1px;
        background-color: #ddd;
    }

    .divider-or span {
        padding: 0 10px;
        font-size: 12px;
        color: #999;
    }

    .social-btn--google,
    .social-btn--facebook {
        padding: 10px 20px;
        border-radius: 6px;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;

        gap: 10px;

        font-size: 14px;
        font-weight: 500;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;

        line-height: 1.5;
        transition: all 0.2s ease;
    }

    .social-btn--google {
        background-color: #ffffff;
        border: 1px solid #d9d9d9;
        color: #333333;
        font-weight: bolder;
    }

    .social-btn--google:hover {
        background-color: #f8f9fa;
        border-color: #cccccc;
        color: #333333;
    }

    .social-btn--google i.fa-google {
        font-size: 18px;
        color: red;
    }

    .social-btn--facebook {
        background-color: #ffffff;
        color: #000000;
        font-family: 'Lato', sans-serif;
        font-weight: bolder;
        border: 1px solid #d9d9d9;
    }

    .social-btn--facebook i.fa-facebook-f {
        font-size: 18px;
        font-weight: bolder;
        color: #4285F4;
    }
    </style>
</head>

<body class="login-page-body">

    <div class="container-fluid h-100">
        <div class="row h-100">
            <div class="col-md-7 d-none d-md-flex login-bg-left">
                <div class="text-center text-white">
                    <img src="{{ asset('assets/images/images.png') }}" alt="Shopee Logo" width="100%" height="auto">
                    <h2>Nền tảng thương mại điện tử</h2>
                    <p>yêu thích ở Đông Nam Á & Đài Loan</p>
                </div>
            </div>
            <div class="col-md-5 d-flex align-items-center justify-content-center">
                <div class="login-form-container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="mb-0 fw-bold" style="font-family: 'Lato';">Đăng nhập</h4>
                        <a href="#" class="btn btn-sm btn-outline-danger" style="font-family: 'Lato';">QR</a>
                    </div>
                    <form action="{{ route('login') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <input type="text" name="email" class="form-control" placeholder="Email/SĐT/Tên đăng nhập"
                                style="font-family: 'Lato'; font-size: 16px; font-weight: lighter;" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" name="password" class="form-control" placeholder="Mật khẩu"
                                style="font-family: 'Lato'; font-size: 16px; font-weight: lighter;" required>
                        </div>
                        <button type="submit" class="btn btn-login w-100 text-white"
                            style="font-family: 'Lato'; font-size: 16px; font-weight: bold;">ĐĂNG NHẬP</button>
                    </form>

                    <div class="d-flex justify-content-between my-3">
                        <a href="#" class="small text-blue-500 text-decoration-none" style="font-family: 'Lato'; font-size: 16px;
                        font-weight: bolder;">Quên mật khẩu</a>
                        <a href="#" class="small text-blue-500 text-decoration-none" style="font-family: 'Lato'; font-size: 16px;
                        font-weight: bolder;">SMS</a>
                    </div>

                    <div class="divider-or">
                        <hr>
                        <span style="font-family: 'Lato'; font-weight: lighter;">HOẶC</span>
                        <hr>
                    </div>
                    <div class="d-flex text-center align-items-center justify-center gap-2 mt-3">
                        <a href="#" class="btn social-btn--google">
                            <i class="fab fa-google"></i> Google
                        </a>
                        <a href="#" class="btn social-btn--facebook">
                            <i class="fab fa-facebook-f"></i> Facebook
                        </a>
                    </div>


                    <p class="text-center mt-4 text-gray-500"
                        style="font-family: 'Lato'; font-size: 15px; font-weight: 500;">
                        Bạn mới biết đến Shopee? <a href="{{ route('register') }}"
                            class="text-decoration-none text-danger"
                            style="font-family: 'Lato'; font-size: 15px; font-weight: 500;">Đăng ký</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</body>

</html>