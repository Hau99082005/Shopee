@extends('admin.admin')
@section('title', 'Customers')
@push('styles')
<style>
    /* Bảng khách hàng admin: bo góc, bóng đổ, màu cam Shopee */
    .customer-table-container {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(255, 87, 34, 0.10);
        padding: 32px 18px;
        margin-top: 24px;
    }
    .customer-table th {
        background: #ff5722;
        color: #fff;
        text-align: center;
        font-weight: 700;
        font-size: 1rem;
    }
    .customer-table td {
        vertical-align: middle;
        text-align: center;
        font-size: 0.98rem;
        background: #fafafa;
    }
</style>
@endpush
@section('content')
<!-- Container chính của bảng khách hàng -->
<div class="container-fluid customer-table-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <!-- Tiêu đề trang -->
        <h1 class="h3 mb-0 text-gray-800">Customers</h1>
    </div>
    <div class="card shadow mb-4" style="border-radius: 12px;">
        <div class="card-body">
            <div class="table-responsive">
                <!-- Bảng danh sách khách hàng -->
                <table class="table table-bordered table-hover customer-table" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th> <!-- Cột ID khách hàng -->
                            <th>Name</th> <!-- Cột tên khách hàng -->
                            <th>Email</th> <!-- Cột email khách hàng -->
                            <th>Orders</th> <!-- Cột số lượng đơn hàng -->
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Lặp qua từng khách hàng và hiển thị thông tin -->
                        @foreach($customers as $customer)
                            <tr>
                                <td>{{ $customer->id }}</td> <!-- Hiển thị ID -->
                                <td>{{ $customer->name }}</td> <!-- Hiển thị tên -->
                                <td>{{ $customer->email }}</td> <!-- Hiển thị email -->
                                <td>{{ $customer->orders_count }}</td> <!-- Hiển thị số lượng đơn hàng -->
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