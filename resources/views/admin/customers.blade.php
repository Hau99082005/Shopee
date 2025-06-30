@extends('admin.admin')

@section('title', 'Customers')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4">Customers</h1>
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover" id="customersTable" width="100%" cellspacing="0">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Orders</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Nguyen Van A</td>
                            <td>a@example.com</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Tran Thi B</td>
                            <td>b@example.com</td>
                            <td>3</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection