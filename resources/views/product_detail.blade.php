@extends('layouts.app')
@section('title', $product->name)
@section('content')
<div class="container py-4">
    <div class="row">
        <div class="col-md-5">
            <img src="{{ asset('assets/images/' . $product->image) }}" class="img-fluid rounded" alt="{{ $product->name }}">
        </div>
        <div class="col-md-7">
            <h2 class="mb-3">{{ $product->name }}</h2>
            <h4 class="text-danger mb-3">₫{{ number_format($product->price, 0, ',', '.') }}</h4>
            <ul class="list-group mb-3">
                <li class="list-group-item"><strong>Màu sắc:</strong> {{ $detail->color }}</li>
                <li class="list-group-item"><strong>Kích cỡ:</strong> {{ $detail->size }}</li>
                <li class="list-group-item"><strong>Chất liệu:</strong> {{ $detail->material }}</li>
                <li class="list-group-item"><strong>Xuất xứ:</strong> {{ $detail->origin }}</li>
                <li class="list-group-item"><strong>Bảo hành:</strong> {{ $detail->warranty }}</li>
            </ul>
            <div class="mb-3">
                <strong>Mô tả sản phẩm:</strong>
                <p>{{ $detail->description }}</p>
            </div>
            <a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart me-1"></i> Thêm vào giỏ hàng</a>
        </div>
    </div>
</div>
@endsection 