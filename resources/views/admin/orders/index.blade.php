@extends('admin.admin')
@section('title', 'Quản lý Đơn hàng')
@push('styles')
<style>
/* Bảng đơn hàng admin: bo góc, bóng đổ, màu cam Shopee */
.order-table-container {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 4px 24px rgba(255, 87, 34, 0.10);
    padding: 32px 18px;
    margin-top: 24px;
}

.order-table th {
    background: #ff5722;
    color: #fff;
    text-align: center;
    font-weight: 700;
    font-size: 1rem;
}

.order-table td {
    vertical-align: middle;
    text-align: center;
    font-size: 0.98rem;
    background: #fafafa;
}

.order-table .action-btns {
    display: flex;
    gap: 6px;
    justify-content: center;
}
</style>
@endpush
@section('content')
<div class="container-fluid order-table-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3 mb-0 text-gray-800">Quản lý Đơn hàng</h1>
    </div>
    <div class="card shadow mb-4" style="border-radius: 12px;">
        <div class="card-body">
            <div class="table-responsive">
                <!-- Bảng danh sách đơn hàng -->
                <table class="table table-bordered table-hover order-table" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User ID</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Địa chỉ giao</th>
                            <th>Ngày tạo</th>
                            <th class="text-center">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($orders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>
                            <td>{{ $order->user_id }}</td>
                            <td class="text-danger fw-bold">₫{{ $order->total_price }}</td>
                            <td>{{ ucfirst($order->status) }}</td>
                            <td>{{ $order->shipping_address }}</td>
                            <td>{{ $order->created_at }}</td>
                            <td class="text-center action-btns">
                                <!-- Nút xoá đơn hàng -->
                                <form action="{{ route('admin-orders.destroy', $order->id) }}" method="POST"
                                    style="display:inline-block"
                                    onsubmit="return confirm('Bạn chắc chắn muốn xoá đơn hàng này?')">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Xóa</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <!-- Kết thúc bảng -->
            </div>
        </div>
    </div>
</div>
@endsection