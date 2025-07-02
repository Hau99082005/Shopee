@extends('layouts.app')
@section('content')
<style>
    body {
        background: linear-gradient(120deg, #fff 60%, #ffe0b2 100%);
    }
    .success-container {
        min-height: 80vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: transparent;
    }
    .success-card {
        background: rgba(255,255,255,0.95);
        border-radius: 32px;
        box-shadow: 0 8px 40px rgba(255,87,34,0.15), 0 2px 8px rgba(0,0,0,0.06);
        padding: 64px 40px 48px 40px;
        text-align: center;
        max-width: 480px;
        width: 100%;
        position: relative;
        animation: fadeInUp 0.7s cubic-bezier(.39,.575,.565,1.000);
    }
    .success-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 28px;
    }
    .success-icon .icon-bg {
        background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
        border-radius: 50%;
        width: 90px;
        height: 90px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 4px 24px rgba(67,233,123,0.15);
        animation: pop 0.7s cubic-bezier(.39,.575,.565,1.000);
    }
    .success-icon i {
        font-size: 3.2rem;
        color: #fff;
        text-shadow: 0 2px 8px rgba(67,233,123,0.18);
    }
    .success-title {
        font-size: 2.3rem;
        font-weight: 800;
        background: linear-gradient(90deg, #ff9800 0%, #ff5722 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        margin-bottom: 16px;
        letter-spacing: 1px;
    }
    .success-message {
        font-size: 1.15rem;
        color: #444;
        margin-bottom: 38px;
        font-family: 'Segoe UI', 'Roboto', sans-serif;
    }
    .success-btn {
        display: inline-block;
        margin: 0 10px;
        padding: 16px 38px;
        border-radius: 32px;
        font-weight: 700;
        font-size: 1.15rem;
        background: linear-gradient(90deg, #ff9800 0%, #ff5722 100%);
        color: #fff;
        border: none;
        box-shadow: 0 2px 12px rgba(255,152,0,0.10);
        transition: background 0.2s, transform 0.1s;
        text-decoration: none;
        letter-spacing: 0.5px;
    }
    .success-btn:hover {
        background: linear-gradient(90deg, #ff5722 0%, #ff9800 100%);
        transform: translateY(-2px) scale(1.04);
    }
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }
    @keyframes pop {
        0% { transform: scale(0.7); }
        80% { transform: scale(1.15); }
        100% { transform: scale(1); }
    }
    /* Confetti */
    .confetti {
        position: absolute;
        left: 0; top: 0; width: 100%; height: 100%;
        pointer-events: none;
        z-index: 2;
    }
</style>
<div class="success-container">
    <div class="success-card">
        <canvas class="confetti"></canvas>
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
<script>
// Confetti effect
(function() {
    const canvas = document.querySelector('.confetti');
    if (!canvas) return;
    const ctx = canvas.getContext('2d');
    let W = canvas.width = 420, H = canvas.height = 320;
    let particles = [];
    for(let i=0;i<32;i++) {
        particles.push({
            x: Math.random()*W,
            y: Math.random()*-H,
            r: 6+Math.random()*8,
            d: 10+Math.random()*20,
            color: `hsl(${Math.random()*360},90%,60%)`,
            tilt: Math.random()*10-10
        });
    }
    function draw() {
        ctx.clearRect(0,0,W,H);
        for(let i=0;i<particles.length;i++) {
            let p = particles[i];
            ctx.beginPath();
            ctx.arc(p.x, p.y, p.r, 0, Math.PI*2, false);
            ctx.fillStyle = p.color;
            ctx.fill();
        }
        update();
    }
    function update() {
        for(let i=0;i<particles.length;i++) {
            let p = particles[i];
            p.y += Math.cos(p.d) + 2 + p.r/2;
            p.x += Math.sin(0.5) * 2;
            if(p.y > H) {
                p.x = Math.random()*W;
                p.y = Math.random()*-20;
            }
        }
    }
    setInterval(draw, 30);
})();
</script>
@endsection 