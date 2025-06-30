<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@yield('title', 'Admin Dashboard - Shopee')</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    @stack('styles')

    <style>
        :root {
            --shopee-orange: #ee4d2d;
            --sidebar-bg: #2c3e50;
            --sidebar-text: #ecf0f1;
            --sidebar-hover: #34495e;
            --sidebar-active: var(--shopee-orange);
            --content-bg: #f4f6f9;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--content-bg);
            display: flex;
            min-height: 100vh;
        }

        #sidebar {
            width: 260px;
            min-width: 260px;
            background: var(--sidebar-bg);
            color: var(--sidebar-text);
            transition: all 0.3s;
        }

        #sidebar.collapsed {
            margin-left: -260px;
        }

        .sidebar-header {
            padding: 20px;
            background: #233140;
            text-align: center;
        }

        .sidebar-header .shopee-logo {
            color: var(--shopee-orange);
            font-weight: 700;
            font-size: 1.8rem;
            text-decoration: none;
        }
        
        .sidebar-header .shopee-logo i {
            margin-right: 8px;
        }

        #sidebar .list-unstyled a {
            padding: 15px 20px;
            font-size: 1.1em;
            display: block;
            color: var(--sidebar-text);
            border-left: 4px solid transparent;
            text-decoration: none;
            transition: all 0.2s;
        }

        #sidebar .list-unstyled a:hover {
            background: var(--sidebar-hover);
            color: #fff;
        }
        
        #sidebar .list-unstyled a.active {
            background: var(--sidebar-hover);
            color: #fff;
            border-left: 4px solid var(--sidebar-active);
        }

        #sidebar .list-unstyled a i {
            width: 25px;
            text-align: center;
            margin-right: 10px;
        }

        #content {
            width: 100%;
            padding: 0;
            min-height: 100vh;
            transition: all 0.3s;
        }

        .navbar {
            padding: 1rem 1.5rem;
            background: #fff;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        #sidebarCollapse {
            background: transparent;
            border: none;
            color: #333;
            font-size: 1.5rem;
        }

        .main-content {
            padding: 24px;
        }
        
        .card {
            border: none;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        .user-dropdown .dropdown-toggle::after {
            display: none;
        }
        
        .user-dropdown .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

    </style>
</head>

<body>
    <nav id="sidebar">
        <div class="sidebar-header">
            <a href="/admin" class="shopee-logo"><i class="fas fa-shopping-bag"></i>Shopee</a>
        </div>

        <ul class="list-unstyled components">
            <li>
                <a href="/admin" class="{{ Request::is('admin') ? 'active' : '' }}">
                    <i class="fas fa-tachometer-alt"></i>Dashboard
                </a>
            </li>
            <li>
                <a href="/admin-analytics" class="{{ Request::is('admin-analytics') ? 'active' : '' }}">
                    <i class="fas fa-chart-line"></i>Analytics
                </a>
            </li>
            <li>
                <a href="/admin-products" class="{{ Request::is('admin-products') ? 'active' : '' }}">
                    <i class="fas fa-box"></i>Products
                </a>
            </li>
            <li>
                <a href="/admin-categories" class="{{ Request::is('admin-categories') ? 'active' : '' }}">
                    <i class="fas fa-list"></i>Categories
                </a>
            </li>
            <li>
                <a href="/admin-orders" class="{{ Request::is('admin-orders') ? 'active' : '' }}">
                    <i class="fas fa-shopping-cart"></i>Orders
                </a>
            </li>
            <li>
                <a href="/admin-customers" class="{{ Request::is('admin-customers') ? 'active' : '' }}">
                    <i class="fas fa-users"></i>Customers
                </a>
            </li>
        </ul>
        
        <ul class="list-unstyled CTAs">
            <li>
                <a href="{{ route('logout') }}" 
                   onclick="event.preventDefault(); document.getElementById('logout-form').submit();" 
                   class="logout-link">
                    <i class="fas fa-sign-out-alt"></i>Logout
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            </li>
        </ul>
    </nav>

    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn">
                    <i class="fas fa-align-left"></i>
                </button>

                <form class="d-flex ms-auto me-3">
                    <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                    <button class="btn btn-outline-danger" type="submit">Search</button>
                </form>
                
                <div class="dropdown user-dropdown">
                    <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" id="dropdownUser" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://ui-avatars.com/api/?name={{ urlencode(Auth::user()->name ?? 'Admin') }}&background=ee4d2d&color=fff" alt="avatar" class="user-avatar">
                        <span class="d-none d-sm-inline mx-2 text-dark">{{ Auth::user()->name ?? 'Admin' }}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownUser">
                        <li><a class="dropdown-item" href="{{ route('profile') }}"><i class="fas fa-user-cog me-2"></i>Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="{{ route('logout') }}" 
                               onclick="event.preventDefault(); document.getElementById('logout-form-2').submit();">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                            <form id="logout-form-2" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main class="main-content">
            @yield('content')
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('sidebarCollapse').addEventListener('click', function () {
                document.getElementById('sidebar').classList.toggle('collapsed');
            });
        });
    </script>
    @stack('scripts')
</body>

</html>