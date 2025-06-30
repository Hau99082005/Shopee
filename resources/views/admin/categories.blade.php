@extends('admin.admin')

@section('title', 'Quản lý Danh mục')

@push('styles')
<style>
    .table-actions { white-space: nowrap; }
    .table-actions .btn { margin: 0 2px; }
</style>
@endpush

@section('content')
<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Quản lý Danh mục</h1>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
            <i class="fas fa-plus me-2"></i>Thêm Danh mục
        </button>
    </div>
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="categoriesTable" width="100%" cellspacing="0">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Tên danh mục</th>
                            <th>Số sản phẩm</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{-- Dữ liệu mẫu, thay bằng @foreach khi có dữ liệu thực --}}
                        <tr>
                            <td>1</td>
                            <td>Thời trang nam</td>
                            <td>120</td>
                            <td class="text-center table-actions">
                                <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i> Sửa</button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Điện thoại & Phụ kiện</td>
                            <td>85</td>
                            <td class="text-center table-actions">
                                <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i> Sửa</button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Đồ gia dụng</td>
                            <td>60</td>
                            <td class="text-center table-actions">
                                <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i> Sửa</button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                            </td>
                        </tr>
                        {{-- Kết thúc dữ liệu mẫu --}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Add Category Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addCategoryModalLabel">Thêm Danh mục mới</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="categoryName" class="form-label">Tên danh mục</label>
            <input type="text" class="form-control" id="categoryName" placeholder="Ví dụ: Thời trang nữ">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary">Lưu danh mục</button>
      </div>
    </div>
  </div>
</div>
@endsection

@push('scripts')
<script>
    // JS cho modal hoặc xử lý khác nếu cần
</script>
@endpush 