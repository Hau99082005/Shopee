@extends('admin.admin')
@section('title', 'Thêm Danh mục')
@section('content')
<div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="card shadow p-4" style="width: 480px; max-width: 100%; border-radius: 18px;">
        <h3 class="mb-4 text-center text-primary">Thêm Danh mục mới</h3>
        <form action="{{ route('admin-categories.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label fw-bold">Tên danh mục</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label fw-bold">Ảnh (upload)</label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*">
            </div>
            <div class="mb-3">
                <label for="desc" class="form-label fw-bold">Mô tả</label>
                <textarea class="form-control" id="desc" name="desc" rows="2"></textarea>
            </div>
            <div class="mb-3">
                <label for="parent_id" class="form-label fw-bold">Danh mục cha (nếu có)</label>
                <select class="form-select" id="parent_id" name="parent_id">
                    <option value="">-- Không có --</option>
                    @foreach($parents as $parent)
                        <option value="{{ $parent->id }}">{{ $parent->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="d-grid gap-2 mt-3">
                <button type="submit" class="btn btn-primary btn-lg">Thêm danh mục</button>
            </div>
        </form>
    </div>
</div>
@endsection 