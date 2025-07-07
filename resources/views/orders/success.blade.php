@extends('layouts.app')
@section('content')
<style>
    body {
        background: #fff6e9;
    }
    .success-container {
        min-height: 80vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: transparent;
    }
    .success-card {
        background: #fff;
        border-radius: 24px;
        box-shadow: 0 4px 24px rgba(255,87,34,0.08);
        padding: 48px 32px 36px 32px;
        text-align: center;
        max-width: 420px;
        width: 100%;
        position: relative;
        margin: 0 auto;
    }
    .success-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 22px;
    }
    .success-icon .icon-bg {
        background: #ff9800;
        border-radius: 50%;
        width: 70px;
        height: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 2px 12px rgba(255,152,0,0.10);
    }
    .success-icon i {
        font-size: 2.2rem;
        color: #fff;
    }
    .success-title {
        font-size: 1.7rem;
        font-weight: 700;
        color: #ff5722;
        margin-bottom: 12px;
        letter-spacing: 0.5px;
    }
    .success-message {
        font-size: 1.05rem;
        color: #444;
        margin-bottom: 28px;
        font-family: 'Segoe UI', 'Roboto', sans-serif;
    }
    .success-btn {
        display: inline-block;
        margin: 0 8px;
        padding: 12px 28px;
        border-radius: 24px;
        font-weight: 600;
        font-size: 1rem;
        background: #ff9800;
        color: #fff;
        border: none;
        box-shadow: 0 2px 8px rgba(255,152,0,0.08);
        transition: background 0.2s, transform 0.1s;
        text-decoration: none;
        letter-spacing: 0.3px;
    }
    .success-btn:hover {
        background: #ff5722;
        transform: translateY(-2px) scale(1.03);
    }
</style>
<div class="success-container">
    <div class="success-card">
        <div class="success-icon">
            <span class="icon-bg">
                <i class="fas fa-check"></i>
            </span>
        </div>
        <div class="success-title">Thanh toán thành công!</div>
        <div class="success-message">
            Cảm ơn bạn đã mua sắm tại Shopee.<br>
            Đơn hàng của bạn đã được ghi nhận và sẽ sớm được xử lý.<br>
            Chúc bạn một ngày tốt lành!
        </div>
        <a href="/" class="success-btn">Về trang chủ</a>
        <a href="{{ route('orders.index') }}" class="success-btn">Xem đơn hàng</a>
    </div>
</div>
@endsection 