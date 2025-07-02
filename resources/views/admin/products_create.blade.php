@extends('layouts.app')
@section('content')
<style>
    .product-form-card {
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.08), 0 1.5px 4px rgba(0,0,0,0.04);
        background: #fff;
        transition: box-shadow 0.3s;
    }
    .product-form-card:hover {
        box-shadow: 0 8px 32px rgba(0,0,0,0.12), 0 2px 8px rgba(0,0,0,0.06);
    }
    .product-form-label {
        font-weight: 600;
        color: #222;
        display: flex;
        align-items: center;
        margin-bottom: 6px;
        font-size: 1rem;
    }
    .product-form-label i {
        color: #ff9800;
        margin-right: 8px;
        font-size: 1.1rem;
    }
    .product-form-input:focus, .form-select:focus {
        border-color: #ff5722;
        box-shadow: 0 0 0 2px rgba(255,87,34,0.15);
        transition: border-color 0.2s, box-shadow 0.2s;
    }
    .product-form-btn {
        background: linear-gradient(90deg, #ff5722 0%, #ff9800 100%);
        border: none;
        color: #fff;
        font-weight: 600;
        font-size: 1.1rem;
        border-radius: 8px;
        padding: 12px 0;
        transition: background 0.2s, box-shadow 0.2s, transform 0.1s;
        box-shadow: 0 2px 8px rgba(255,152,0,0.08);
    }
    .product-form-btn:hover, .product-form-btn:focus {
        background: linear-gradient(90deg, #ff9800 0%, #ff5722 100%);
        transform: translateY(-2px) scale(1.03);
        box-shadow: 0 4px 16px rgba(255,87,34,0.12);
    }
    .product-form-input, .form-select {
        width: 100%;
        border-radius: 8px;
        min-height: 44px;
        font-size: 1rem;
        margin-bottom: 16px;
    }
    textarea.product-form-input {
        min-height: 80px;
        resize: vertical;
    }
    @media (max-width: 600px) {
        .product-form-card { padding: 1.2rem !important; }
    }
</style>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="product-form-card shadow p-4" style="width: 500px; max-width: 100%;">
        <h3 class="mb-4 text-center" style="color:#ff5722;font-weight:700;letter-spacing:1px;">Thêm sản phẩm mới</h3>
        <form action="{{ route('admin-products.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label product-form-label"><i class="fas fa-tag"></i> Tên sản phẩm</label>
                <input type="text" class="form-control product-form-input" id="name" name="name" required placeholder="Nhập tên sản phẩm">
            </div>
            <div class="mb-3">
                <label for="image" class="form-label product-form-label"><i class="fas fa-image"></i> Ảnh (upload file)</label>
                <input type="file" class="form-control product-form-input" id="image" name="image" accept="image/*">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label product-form-label"><i class="fas fa-align-left"></i> Mô tả</label>
                <textarea class="form-control product-form-input" id="description" name="description" rows="3" placeholder="Mô tả chi tiết sản phẩm..."></textarea>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="price" class="form-label product-form-label"><i class="fas fa-dollar-sign"></i> Giá</label>
                    <input type="number" class="form-control product-form-input" id="price" name="price" required placeholder="Giá bán">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="price_old" class="form-label product-form-label"><i class="fas fa-tag"></i> Giá cũ</label>
                    <input type="number" class="form-control product-form-input" id="price_old" name="price_old" placeholder="Giá gốc (nếu có)">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="stock" class="form-label product-form-label"><i class="fas fa-box"></i> Tồn kho</label>
                    <input type="number" class="form-control product-form-input" id="stock" name="stock" required placeholder="Số lượng tồn kho">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="seller_id" class="form-label product-form-label"><i class="fas fa-user"></i> Seller</label>
                    <select class="form-select product-form-input" id="seller_id" name="seller_id">
                        <option value="">-- Chọn người bán --</option>
                        @foreach($sellers as $seller)
                            <option value="{{ $seller->id }}">{{ $seller->name }} (ID: {{ $seller->id }})</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <label for="category_id" class="form-label product-form-label"><i class="fas fa-list"></i> Danh mục</label>
                <select class="form-select product-form-input" id="category_id" name="category_id">
                    <option value="">-- Chọn danh mục --</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->name }} (ID: {{ $category->id }})</option>
                    @endforeach
                </select>
            </div>
            <div class="d-grid gap-2 mt-3">
                <button type="submit" class="product-form-btn btn-lg">Thêm sản phẩm</button>
            </div>
        </form>
    </div>
</div>
@endsection 