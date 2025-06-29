<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Mua sắm trực tuyến trên Shopee Việt Nam - Nền tảng thương mại điện tử hàng đầu.">
    <meta name="keywords" content="Shopee, mua sắm, trực tuyến, thời trang, điện tử, gia dụng">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicon-16x16.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('apple-touch-icon.png') }}">
    <link rel="manifest" href="{{ asset('site.webmanifest') }}">
    <title>Admin - Quản Lý Shopee</title>
    @vite(['resources/css/app.css', 'resources/js/app.ts','resources/js/main.js'])
</head>

<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo-details">
                <i class="uil uil-shopping-cart"></i>
                <span class="logo_name">Shopee Admin</span>
            </div>
            <ul class="nav-links">
                <li><a href="admin.html"><i class="uil uil-grid-alt"></i><span class="links_name">Dashboard</span></a>
                </li>
                <li><a href="products.html"><i class="uil uil-box"></i><span class="links_name">Products</span></a></li>
                <li><a href="orders.html"><i class="uil uil-shopping-bag"></i><span class="links_name">Orders</span></a>
                </li>
                <li><a href="analytics.html" class="active"><i class="uil uil-chart"></i><span
                            class="links_name">Analytics</span></a></li>
                <li><a href="customers.html"><i class="uil uil-users-alt"></i><span
                            class="links_name">Customers</span></a></li>
                <li><a href="#" onclick="openLogoutModal()"><i class="uil uil-signout"></i><span
                            class="links_name">Logout</span></a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="header">
                <div class="search">
                    <input type="text" placeholder="Search analytics...">
                    <i class="uil uil-search"></i>
                </div>
                <div class="user">
                    <i class="uil uil-lock auth-icon" data-tooltip="Authentication" onclick="openModal()"></i>
                    <i class="uil uil-palette customize-icon" data-tooltip="Customize"
                        onclick="openCustomizeModal()"></i>
                    <i class="uil uil-moon mode-toggle" onclick="toggleDarkMode()"></i>
                    <img src="https://via.placeholder.com/40" alt="User">
                </div>
            </div>
            <div class="content">
                <h2>Analytics</h2>
                <div class="charts">
                    <div class="chart-container">
                        <h3>Sales Overview</h3>
                        <canvas id="salesChart"></canvas>
                    </div>
                    <div class="chart-container">
                        <h3>Order Status</h3>
                        <canvas id="orderChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="authModal">
        <div class="modal-content">
            <span class="close-modal" onclick="closeModal()">×</span>
            <h2>Admin Authentication</h2>
            <input type="text" placeholder="Username">
            <input type="password" placeholder="Password">
            <button onclick="alert('Authentication submitted!'); closeModal()">Login</button>
        </div>
    </div>

    <div class="modal" id="customizeModal">
        <div class="modal-content">
            <span class="close-modal" onclick="closeCustomizeModal()">×</span>
            <h2>Customize Theme</h2>
            <label for="themeColor">Theme Color:</label>
            <input type="color" id="themeColor" value="#ee4d2d">
            <label for="fontFamily">Font Family:</label>
            <select id="fontFamily">
                <option value="Roboto">Roboto</option>
                <option value="Arial">Arial</option>
                <option value="Open Sans">Open Sans</option>
            </select>
            <label for="animations">Enable Animations:</label>
            <input type="checkbox" id="animations" checked>
            <label for="sidebarState">Sidebar Default:</label>
            <select id="sidebarState">
                <option value="expanded">Expanded</option>
                <option value="collapsed">Collapsed</option>
            </select>
            <button onclick="applyCustomizations()">Apply</button>
        </div>
    </div>

    <div class="modal" id="logoutModal">
        <div class="modal-content">
            <span class="close-modal" onclick="closeLogoutModal()">×</span>
            <h2>Confirm Logout</h2>
            <p>Bạn có chắc chắn muốn kết thúc phiên làm việc của mình không? Tất cả các thay đổi chưa lưu sẽ bị mất.</p>
            <button onclick="logout()">Logout</button>
            <button onclick="closeLogoutModal()">Cancel</button>
        </div>
    </div>
</body>

</html>