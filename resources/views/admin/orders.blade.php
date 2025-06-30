@extends('admin.admin')

@section('title', 'Orders')

@push('styles')
<style>
    .badge-status {
        font-size: 1em;
        padding: 0.5em 1em;
        border-radius: 1em;
    }
</style>
@endpush

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4">Orders</h1>
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="ordersTable" width="100%" cellspacing="0">
                    <thead class="table-dark">
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>001</td>
                            <td>Nguyen Van A</td>
                            <td>$89.99</td>
                            <td><span class="badge bg-warning text-dark badge-status">Pending</span></td>
                        </tr>
                        <tr>
                            <td>002</td>
                            <td>Tran Thi B</td>
                            <td>$149.99</td>
                            <td><span class="badge bg-info text-dark badge-status">Shipped</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection