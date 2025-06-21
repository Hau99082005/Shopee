<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Shopee Clone</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
    body {
        margin: 0;
        font-family: 'Helvetica Neue', Arial, sans-serif;
        background-color: #f5f5f5;
        color: #333;
    }

    .auth-container {
        display: flex;
        min-height: 100vh;
        background: linear-gradient(180deg, #F35022 0%, #F35022 100%);

    }


    .auth-left {
        flex: 1;
        background: url('https://cf.shopee.vn/file/sg-11134004-23020-1ml2j2v7vclvab') center/cover no-repeat;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        text-align: center;
        padding: 20px;
    }

    .auth-left img {
        width: 150px;
        margin-bottom: 20px;
    }

    .auth-left p {
        font-size: 16px;
        max-width: 500px;
        line-height: 1.5;
        opacity: 0.9;
    }

    .auth-right {
        flex: 1;
        background: white;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .form-box {
        width: 100%;
        max-width: 400px;
        padding: 30px;
        background: white;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .form-box h3 {
        font-size: 24px;
        font-weight: 500;
        color: #ee4d2d;
        margin-bottom: 20px;
        text-align: center;
    }

    .form-control {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #d9d9d9;
        border-radius: 4px;
        font-size: 14px;
        outline: none;
        transition: border-color 0.3s;
    }

    .form-control:focus {
        border-color: #ee4d2d;
    }

    .btn-primary {
        background-color: #ee4d2d;
        color: white;
        padding: 12px;
        width: 100%;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #d43c1f;
    }

    .divider {
        display: flex;
        align-items: center;
        text-align: center;
        margin: 20px 0;
    }

    .divider hr {
        flex: 1;
        border: none;
        border-top: 1px solid #e0e0e0;
    }

    .divider span {
        padding: 0 15px;
        color: #999;
        font-size: 14px;
    }

    .social-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 12px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        margin-bottom: 10px;
        text-decoration: none;
        color: #333;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    .social-btn:hover {
        background-color: #f5f5f5;
    }

    .social-btn i {
        margin-right: 10px;
        font-size: 18px;
    }

    .auth-switch-link {
        text-align: center;
        margin-top: 20px;
        font-size: 14px;
        color: #555;
    }

    .auth-switch-link a {
        color: #ee4d2d;
        text-decoration: none;
        font-weight: 500;
    }

    .auth-switch-link a:hover {
        text-decoration: underline;
    }

    @media (max-width: 768px) {
        .auth-container {
            flex-direction: column;
        }

        .auth-left {
            flex: none;
            min-height: 200px;
        }

        .auth-right {
            flex: none;
            padding: 20px;
        }

        .form-box {
            padding: 20px;
        }
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

<body>
    <div class="auth-container container-fluid">
        <div class="auth-left">
            <img src="assets/images/images.png" alt="Shopee Logo">
            <span style="font-family: 'Lato'; font-size: 25px;
            font-weight: bolder;">Nền tảng thương mại điện tử<br /> yêu thích ở Đông Nam Á & Đài Loan</span>
        </div>
        <div class="auth-right">
            <div class="form-box">
                <h3 style="color: black; text-align: left; font-family: 'Lato'; font-size: 25px; font-weight: bold;">
                    Đăng ký</h3>
                <form action="/register" method="POST">
                    <input type="hidden" name="_token" value="csrf-token">
                    <input type="text" name="phone" class="form-control" placeholder="Số điện thoại" required>
                    <button type="submit" class="btn-primary">Tiếp Theo</button>
                </form>

                <div class="divider">
                    <hr><span>HOẶC</span>
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

                <p class="auth-switch-link" style="font-family: 'Lato'; font-size: 16px; font-weight: lighter;">
                    Bạn đã có tài khoản? <a href="{{ route('login') }}"
                        style="font-family: 'Lato'; font-size: 16px; font-weight: lighter;">Đăng nhập</a>
                </p>
            </div>
        </div>
    </div>
</body>

</html>