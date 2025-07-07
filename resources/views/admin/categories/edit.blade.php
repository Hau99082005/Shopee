@extends('admin.admin')
@section('title', 'Sửa Danh mục')
@section('content')
<div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="card shadow p-4" style="width: 480px; max-width: 100%; border-radius: 18px;">
        <h3 class="mb-4 text-center text-primary">Sửa Danh mục</h3>
        <form action="{{ route('admin-categories.update', $category->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="mb-3">
                <label for="name" class="form-label fw-bold">Tên danh mục</label>
                <input type="text" class="form-control" id="name" name="name" value="{{ $category->name }}" required>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label fw-bold">Ảnh (upload)</label>
                <input type="file" class="form-control" id="image" name="image" accept="image/*">
                @if($category->image)
                    <div class="mt-2">
                        <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{ $category->name }}" width="80">
                        <div>{{ $category->image }}</div>
                    </div>
                @endif
            </div>
            <div class="mb-3">
                <label for="desc" class="form-label fw-bold">Mô tả</label>
                <textarea class="form-control" id="desc" name="desc" rows="2">{{ $category->desc }}</textarea>
            </div>
            <div class="mb-3">
                <label for="parent_id" class="form-label fw-bold">Danh mục cha (nếu có)</label>
                <select class="form-select" id="parent_id" name="parent_id">
                    <option value="">-- Không có --</option>
                    @foreach($parents as $parent)
                        <option value="{{ $parent->id }}" @if($category->parent_id == $parent->id) selected @endif>{{ $parent->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="d-grid gap-2 mt-3">
                <button type="submit" class="btn btn-primary btn-lg">Cập nhật</button>
            </div>
        </form>
    </div>
</div>
@endsection 