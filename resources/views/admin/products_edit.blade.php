@extends('layouts.app')
@section('content')
<div class="container">
    <h2>Sửa sản phẩm</h2>
    <form action="{{ route('admin-products.update', $product->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label for="name" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="name" name="name" value="{{ $product->name }}" required>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Ảnh (upload file)</label>
            <input type="file" class="form-control" id="image" name="image">
            @if($product->image)
                <div class="mt-2">
                    <img src="{{ asset('assets/images/' . $product->image) }}" alt="{{ $product->name }}" width="100">
                    <div>{{ $product->image }}</div>
                </div>
            @endif
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Mô tả</label>
            <textarea class="form-control" id="description" name="description">{{ $product->description }}</textarea>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Giá</label>
            <input type="number" class="form-control" id="price" name="price" value="{{ $product->price }}" required>
        </div>
        <div class="mb-3">
            <label for="price_old" class="form-label">Giá cũ</label>
            <input type="number" class="form-control" id="price_old" name="price_old" value="{{ $product->price_old }}">
        </div>
        <div class="mb-3">
            <label for="stock" class="form-label">Tồn kho</label>
            <input type="number" class="form-control" id="stock" name="stock" value="{{ $product->stock }}" required>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3 input-group">
                <span class="input-icon"><i class="fas fa-user"></i></span>
                <label for="seller_id" class="form-label product-form-label">Seller</label>
                <select class="form-select product-form-input" id="seller_id" name="seller_id">
                    <option value="">-- Chọn người bán --</option>
                    @foreach($sellers as $seller)
                        <option value="{{ $seller->id }}" @if($product->seller_id == $seller->id) selected @endif>{{ $seller->name }} (ID: {{ $seller->id }})</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-6 mb-3 input-group">
                <span class="input-icon"><i class="fas fa-list"></i></span>
                <label for="category_id" class="form-label product-form-label">Danh mục</label>
                <select class="form-select product-form-input" id="category_id" name="category_id">
                    <option value="">-- Chọn danh mục --</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}" @if($product->category_id == $category->id) selected @endif>{{ $category->name }} (ID: {{ $category->id }})</option>
                    @endforeach
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>
@endsection 