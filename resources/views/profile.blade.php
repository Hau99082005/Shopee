@extends('layouts.app')

@section('title', 'Hồ sơ của tôi - Shopee')

@push('styles')
<link href="https://fonts.googleapis.com/css?family=Lato:400,700&display=swap" rel="stylesheet">
<style>
.shopee-profile-sidebar {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.06);
    padding: 0;
    font-family: 'Lato', Arial, sans-serif;
}

.shopee-profile-sidebar .profile-avatar {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #f5f5f5;
}

.shopee-profile-sidebar .profile-name {
    font-weight: 600;
    font-size: 1.1rem;
    margin-top: 0.5rem;
}

.shopee-profile-sidebar .profile-edit-link {
    color: #05a;
    font-size: 0.9rem;
    text-decoration: underline;
    cursor: pointer;
}

.shopee-profile-sidebar .list-group-item {
    border: none;
    font-size: 1rem;
    padding: 14px 24px;
    color: #333;
    background: none;
    font-family: 'Lato', Arial, sans-serif;
}

.shopee-profile-sidebar .list-group-item.active {
    color: #ee4d2d;
    background: #fff7f1;
    font-weight: 600;
}

.shopee-profile-sidebar .list-group-item i {
    width: 22px;
    text-align: center;
    color: #ee4d2d;
}

.shopee-profile-main {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.06);
    padding: 32px 40px 40px 40px;
    font-family: 'Lato', Arial, sans-serif;
}

.shopee-profile-main .profile-title {
    font-size: 1.4rem;
    font-weight: 600;
    color: #222;
    margin-bottom: 24px;
}

.shopee-profile-main .profile-form-label {
    font-size: 0.95rem;
    color: #888;
    margin-bottom: 6px;
    font-weight: 500;
}

.shopee-profile-main .form-control {
    height: 44px;
    border-radius: 4px;
    font-size: 1.05rem;
    font-family: 'Lato', Arial, sans-serif;
}

.shopee-profile-main .btn-save {
    background: #ee4d2d;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-weight: 600;
    font-size: 1.1rem;
    padding: 10px 36px;
    margin-top: 18px;
}

.shopee-profile-main .btn-save:hover {
    background: #d73210;
}

.shopee-profile-main .avatar-upload {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
}

.shopee-profile-main .avatar-upload img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #f5f5f5;
}

.shopee-profile-main .avatar-upload label {
    background: #fff;
    border: 1px solid #ee4d2d;
    color: #ee4d2d;
    border-radius: 4px;
    padding: 4px 18px;
    font-size: 0.95rem;
    cursor: pointer;
    font-weight: 500;
    margin-top: 6px;
}

.shopee-profile-main .avatar-upload label:hover {
    background: #fff7f1;
}
</style>
@endpush

@section('content')
<div class="container-xl py-4">
    <div class="row g-4">
        <div class="col-lg-3">
            <div class="shopee-profile-sidebar p-0">
                <div class="d-flex flex-column align-items-center py-4 border-bottom">
                    <img src="{{ Auth::user()->avatar ?? asset('assets/images/default-avatar.png') }}"
                        class="profile-avatar" alt="avatar">
                    <div class="profile-name">{{ Auth::user()->name }}</div>
                    <div class="profile-edit-link"
                        style="text-decoration: none; color: black; font-family: 'Lato', sans-serif;">Sửa Hồ
                        Sơ
                    </div>
                </div>
                <div class="list-group list-group-flush mt-2">
                    <a href="#" class="list-group-item active"><i class="fa fa-user"></i> Hồ Sơ</a>
                    <a href="#" class="list-group-item"><i class="fa fa-map-marker-alt"></i> Địa Chỉ</a>
                    <a href="#" class="list-group-item"><i class="fa fa-lock"></i> Đổi Mật Khẩu</a>
                    <a href="#" class="list-group-item"><i class="fa fa-bell"></i> Cài Đặt Thông Báo</a>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="shopee-profile-main">
                <div class="profile-title mb-4">Hồ Sơ Của Tôi
                    <div class="text-muted small fw-normal">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                </div>
                <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="row g-4 align-items-center">
                        <div class="col-md-8">
                            <div class="mb-3">
                                <label for="name" class="profile-form-label">Tên đăng nhập</label>
                                <input type="text" class="form-control" id="name" name="name"
                                    value="{{ Auth::user()->name }}" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="profile-form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    value="{{ Auth::user()->email }}" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="profile-form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone"
                                    value="{{ Auth::user()->phone }}">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="profile-form-label">Địa chỉ</label>
                                <textarea class="form-control" id="address" name="address"
                                    rows="2">{{ Auth::user()->address }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="avatar-upload">
                                <img src="{{ Auth::user()->avatar ?? asset('assets/images/default-avatar.png') }}"
                                    alt="avatar">
                                <label for="avatar">Chọn Ảnh
                                    <input type="file" id="avatar" name="avatar" accept="image/*" style="display:none;">
                                </label>
                                <div class="text-muted small mt-1">Dung lượng file tối đa 1 MB<br>Định dạng: .JPEG, .PNG
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-save">Lưu</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const avatarInput = document.getElementById('avatar');
    if (avatarInput) {
        avatarInput.addEventListener('change', function(evt) {
            const [file] = this.files;
            if (file) {
                this.closest('.avatar-upload').querySelector('img').src = URL.createObjectURL(file);
            }
        });
    }
});
</script>
@endpush