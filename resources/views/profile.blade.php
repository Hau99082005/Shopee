@extends('layouts.app')

@section('title', 'Tài khoản của tôi - Shopee Clone')

@section('content')
<div class="container-xl">
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="fa fa-user me-2"></i>Tài khoản</h5>
                </div>
                <div class="list-group list-group-flush">
                    <a href="#profile" class="list-group-item list-group-item-action active" data-bs-toggle="list">
                        <i class="fa fa-user-circle me-2"></i>Thông tin cá nhân
                    </a>
                    <a href="#orders" class="list-group-item list-group-item-action" data-bs-toggle="list">
                        <i class="fa fa-shopping-bag me-2"></i>Đơn hàng
                    </a>
                    <a href="#favorites" class="list-group-item list-group-item-action" data-bs-toggle="list">
                        <i class="fa fa-heart me-2"></i>Sản phẩm yêu thích
                    </a>
                    <a href="#addresses" class="list-group-item list-group-item-action" data-bs-toggle="list">
                        <i class="fa fa-map-marker-alt me-2"></i>Địa chỉ
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="tab-content">
                <div class="tab-pane fade show active" id="profile">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Thông tin cá nhân</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('profile.update') }}" method="POST">
                                @csrf
                                @method('PUT')
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="name" class="form-label">Họ và tên</label>
                                        <input type="text" class="form-control" id="name" name="name" value="{{ Auth::user()->name }}" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" value="{{ Auth::user()->email }}" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="{{ Auth::user()->phone }}">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="role" class="form-label">Vai trò</label>
                                        <input type="text" class="form-control" id="role" value="{{ ucfirst(Auth::user()->role) }}" readonly>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <textarea class="form-control" id="address" name="address" rows="3">{{ Auth::user()->address }}</textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <div class="tab-pane fade" id="orders">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Đơn hàng của tôi</h5>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">Bạn chưa có đơn hàng nào.</p>
                        </div>
                    </div>
                </div>
                
                <div class="tab-pane fade" id="favorites">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Sản phẩm yêu thích</h5>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">Bạn chưa có sản phẩm yêu thích nào.</p>
                        </div>
                    </div>
                </div>
                
                <div class="tab-pane fade" id="addresses">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">Địa chỉ giao hàng</h5>
                        </div>
                        <div class="card-body">
                            <p class="text-muted">Bạn chưa có địa chỉ giao hàng nào.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 