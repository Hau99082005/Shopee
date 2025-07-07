@extends('admin.admin')
@section('title', 'Quản lý Danh mục')
@push('styles')
<style>
    .category-table-container {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(255,87,34,0.10);
        padding: 32px 18px;
        margin-top: 24px;
    }
    .category-table th {
        background: #ff5722;
        color: #fff;
        text-align: center;
        font-weight: 700;
        font-size: 1rem;
    }
    .category-table td {
        vertical-align: middle;
        text-align: center;
        font-size: 0.98rem;
        background: #fafafa;
    }
    .category-table img {
        max-width: 48px;
        max-height: 48px;
        border-radius: 8px;
        object-fit: cover;
    }
    .category-table .action-btns {
        display: flex;
        gap: 6px;
        justify-content: center;
    }
</style>
@endpush
@section('content')
<div class="container-fluid category-table-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Quản lý Danh mục</h1>
        <a href="{{ route('admin-categories.create') }}" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Thêm Danh mục
        </a>
    </div>
    <div class="card shadow mb-4" style="border-radius: 12px;">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover category-table" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên danh mục</th>
                            <th>Ảnh</th>
                            <th>Mô tả</th>
                            <th>Danh mục cha</th>
                            <th>Ngày tạo</th>
                            <th>Ngày cập nhật</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($categories as $category)
                            <tr>
                                <td>{{ $category->id }}</td>
                                <td>{{ $category->name }}</td>
                                <td>
                                    @if($category->image)
                                        <img src="{{ asset('assets/images/' . $category->image) }}" alt="{{ $category->name }}">
                                    @endif
                                    <div style="font-size:0.85em; color:#888;">{{ $category->image }}</div>
                                </td>
                                <td>{{ $category->desc }}</td>
                                <td>{{ $category->parent_id }}</td>
                                <td>{{ $category->created_at }}</td>
                                <td>{{ $category->updated_at }}</td>
                                <td class="text-center action-btns">
                                    <a href="{{ route('admin-categories.edit', $category->id) }}" class="btn btn-sm btn-info">
                                        <i class="fas fa-edit"></i> Sửa
                                    </a>
                                    <form action="{{ route('admin-categories.destroy', $category->id) }}" method="POST" style="display:inline-block" onsubmit="return confirm('Bạn chắc chắn muốn xoá?')">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection 