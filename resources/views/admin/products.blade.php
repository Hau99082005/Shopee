@extends('admin.admin')

@section('title', 'Quản lý Sản phẩm')

@push('styles')
{{-- Thêm CSS cho trang này nếu cần --}}
<style>
    .table-actions {
        white-space: nowrap;
    }
    .table-actions .btn {
        margin: 0 2px;
    }
</style>
@endpush

@section('content')
<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Quản lý Sản phẩm</h1>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
            <i class="fas fa-plus me-2"></i>Thêm Sản phẩm
        </button>
    </div>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="productsTable" width="100%" cellspacing="0">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Tồn kho</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{-- Dữ liệu mẫu - bạn sẽ thay thế bằng vòng lặp @foreach sau này --}}
                        <tr>
                            <td>1</td>
                            <td>Wireless Mouse</td>
                            <td>$29.99</td>
                            <td>150</td>
                            <td class="text-center table-actions">
                                <button class="btn btn-sm btn-info"><i class="fas fa-edit"></i> Sửa</button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Bluetooth Headphones</td>
                            <td>$59.99</td>
                            <td>80</td>
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

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addProductModalLabel">Thêm Sản phẩm mới</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="productName" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="productName" placeholder="Ví dụ: Áo thun nam">
          </div>
          <div class="mb-3">
            <label for="productPrice" class="form-label">Giá</label>
            <input type="number" class="form-control" id="productPrice" placeholder="Ví dụ: 250000" step="1000">
          </div>
          <div class="mb-3">
            <label for="productStock" class="form-label">Số lượng tồn kho</label>
            <input type="number" class="form-control" id="productStock" placeholder="Ví dụ: 100">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary">Lưu sản phẩm</button>
      </div>
    </div>
  </div>
</div>
@endsection

@push('scripts')
{{-- Thêm JS cho trang này nếu cần --}}
<script>
    // Có thể thêm JS để xử lý DataTables hoặc các tương tác khác ở đây
</script>
@endpush