@extends('admin.admin')

@section('title', 'Analytics')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4">Analytics</h1>
    <div class="row">
        <div class="col-lg-6 mb-4">
            <div class="card shadow">
                <div class="card-header bg-dark text-white">
                    <i class="fas fa-chart-line me-2"></i>Sales Overview
                </div>
                <div class="card-body">
                    <canvas id="salesChart" height="180"></canvas>
                    <div class="text-center text-muted mt-3">(Biểu đồ doanh số sẽ hiển thị ở đây)</div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 mb-4">
            <div class="card shadow">
                <div class="card-header bg-dark text-white">
                    <i class="fas fa-chart-pie me-2"></i>Order Status
                </div>
                <div class="card-body">
                    <canvas id="orderChart" height="180"></canvas>
                    <div class="text-center text-muted mt-3">(Biểu đồ trạng thái đơn hàng sẽ hiển thị ở đây)</div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
{{-- Nếu muốn dùng Chart.js, có thể thêm script ở đây --}}
@endpush