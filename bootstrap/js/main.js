// Handle quantity buttons
document.querySelectorAll('.quantity-control').forEach(control => {
    const input = control.querySelector('.quantity-input');
    const decrementBtn = control.querySelector('.quantity-btn:first-child');
    const incrementBtn = control.querySelector('.quantity-btn:last-child');

    decrementBtn.addEventListener('click', () => {
        if (input.value > 1) {
            input.value = parseInt(input.value) - 1;
            updateCartTotal();
        }
    });

    incrementBtn.addEventListener('click', () => {
        input.value = parseInt(input.value) + 1;
        updateCartTotal();
    });

    input.addEventListener('change', () => {
        if (input.value < 1) input.value = 1;
        updateCartTotal();
    });
});

// Handle checkboxes
const selectAllCheckbox = document.querySelector('.select-all-checkbox');
const itemCheckboxes = document.querySelectorAll('.cart-item-checkbox');

selectAllCheckbox.addEventListener('change', () => {
    itemCheckboxes.forEach(checkbox => {
        checkbox.checked = selectAllCheckbox.checked;
    });
    updateCartTotal();
});

itemCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        const allChecked = Array.from(itemCheckboxes).every(cb => cb.checked);
        selectAllCheckbox.checked = allChecked;
        updateCartTotal();
    });
});

// Update cart total
function updateCartTotal() {
    let total = 0;
    document.querySelectorAll('.cart-item').forEach(item => {
        const checkbox = item.querySelector('.cart-item-checkbox');
        if (checkbox.checked) {
            const price = parseFloat(item.querySelector('.price').dataset.price);
            const quantity = parseInt(item.querySelector('.quantity-input').value);
            total += price * quantity;
        }
    });
    
    document.querySelector('.summary-total .price').textContent = `₫${total.toLocaleString()}`;
    
    // Update selected items count
    const selectedCount = Array.from(itemCheckboxes).filter(cb => cb.checked).length;
    document.querySelector('.selected-count').textContent = selectedCount;
}

// Voucher modal
const voucherButton = document.querySelector('.voucher-button');
const voucherModal = document.querySelector('.voucher-modal');
const closeVoucherModal = document.querySelector('.close-voucher-modal');

voucherButton.addEventListener('click', () => {
    voucherModal.classList.add('active');
    document.body.style.overflow = 'hidden';
});

closeVoucherModal.addEventListener('click', () => {
    voucherModal.classList.remove('active');
    document.body.style.overflow = '';
});

voucherModal.addEventListener('click', (e) => {
    if (e.target === voucherModal) {
        voucherModal.classList.remove('active');
        document.body.style.overflow = '';
    }
});

// Handle voucher selection
document.querySelectorAll('.voucher-item').forEach(item => {
    item.addEventListener('click', () => {
        const voucherCode = item.dataset.code;
        const voucherDiscount = parseFloat(item.dataset.discount);
        
        // Update selected voucher display
        document.querySelector('.selected-voucher').textContent = voucherCode;
        
        // Apply discount
        updateCartTotal();
        
        // Close modal
        voucherModal.classList.remove('active');
        document.body.style.overflow = '';
    });
}); 

let salesChart, orderChart;

function toggleDarkMode() {
    document.body.classList.toggle('dark');
    localStorage.setItem('theme', document.body.classList.contains('dark') ? 'dark' : 'light');
    if (window.location.pathname.includes('analytics.html') || window.location.pathname.includes('admin.html')) {
        updateCharts();
    }
}

function openModal() {
    document.getElementById('authModal').style.display = 'flex';
}

function closeModal() {
    document.getElementById('authModal').style.display = 'none';
}

function openCustomizeModal() {
    document.getElementById('customizeModal').style.display = 'flex';
    document.getElementById('themeColor').value = localStorage.getItem('themeColor') || '#ee4d2d';
    document.getElementById('fontFamily').value = localStorage.getItem('fontFamily') || 'Roboto';
    document.getElementById('animations').checked = localStorage.getItem('animations') !== 'false';
    document.getElementById('sidebarState').value = localStorage.getItem('sidebarState') || 'expanded';
}

function closeCustomizeModal() {
    document.getElementById('customizeModal').style.display = 'none';
}

function openAddProductModal() {
    document.getElementById('addProductModal').style.display = 'flex';
}

function closeAddProductModal() {
    document.getElementById('addProductModal').style.display = 'none';
}

function openLogoutModal() {
    document.getElementById('logoutModal').style.display = 'flex';
}

function closeLogoutModal() {
    document.getElementById('logoutModal').style.display = 'none';
}

function logout() {
    localStorage.removeItem('theme');
    localStorage.removeItem('themeColor');
    localStorage.removeItem('fontFamily');
    localStorage.removeItem('animations');
    localStorage.removeItem('sidebarState');
    alert('Bạn đã đăng xuất thành công! Tạm biệt!');
    window.location.href = 'login.html';
}

function applyCustomizations() {
    const color = document.getElementById('themeColor').value;
    const font = document.getElementById('fontFamily').value;
    const animations = document.getElementById('animations').checked;
    const sidebarState = document.getElementById('sidebarState').value;

    document.documentElement.style.setProperty('--theme-color', color);
    localStorage.setItem('themeColor', color);

    document.documentElement.style.setProperty('--font-family', font);
    localStorage.setItem('fontFamily', font);

    document.body.classList.toggle('no-animations', !animations);
    localStorage.setItem('animations', animations);

    const sidebar = document.querySelector('.sidebar');
    sidebar.classList.toggle('collapsed', sidebarState === 'collapsed');
    localStorage.setItem('sidebarState', sidebarState);

    closeCustomizeModal();
    if (window.location.pathname.includes('analytics.html') || window.location.pathname.includes('admin.html')) {
        updateCharts();
    }
}

function initCharts() {
    const isDark = document.body.classList.contains('dark');
    const themeColor = getComputedStyle(document.documentElement).getPropertyValue('--theme-color').trim();

    if (salesChart) salesChart.destroy();
    if (orderChart) orderChart.destroy();

    salesChart = new Chart(document.getElementById('salesChart'), {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Sales',
                data: [1200, 1900, 3000, 5000, 2300, 3400],
                borderColor: themeColor,
                backgroundColor: themeColor + '33',
                fill: true
            }]
        },
        options: {
            plugins: { legend: { labels: { color: isDark ? '#e0e0e0' : '#333' } } },
            scales: {
                x: { ticks: { color: isDark ? '#e0e0e0' : '#333' } },
                y: { ticks: { color: isDark ? '#e0e0e0' : '#333' } }
            }
        }
    });

    orderChart = new Chart(document.getElementById('orderChart'), {
        type: 'doughnut',
        data: {
            labels: ['Pending', 'Shipped', 'Cancelled'],
            datasets: [{
                data: [50, 30, 20],
                backgroundColor: [themeColor, '#28a745', '#ff4d4d']
            }]
        },
        options: {
            plugins: { legend: { labels: { color: isDark ? '#e0e0e0' : '#333' } } }
        }
    });
}

function updateCharts() {
    initCharts();
}

// Table sorting
document.querySelectorAll('.sortable th').forEach(header => {
    header.addEventListener('click', () => {
        const table = header.closest('table');
        const index = Array.from(header.parentElement.children).indexOf(header);
        const type = header.dataset.sort;
        const rows = Array.from(table.querySelector('tbody').rows);

        const sortedRows = rows.sort((a, b) => {
            let aValue = a.cells[index].textContent.trim();
            let bValue = b.cells[index].textContent.trim();

            if (type === 'number') {
                aValue = parseFloat(aValue.replace(/[^0-9.]/g, '')) || 0;
                bValue = parseFloat(bValue.replace(/[^0-9.]/g, '')) || 0;
                return aValue - bValue;
            } else {
                return aValue.localeCompare(bValue);
            }
        });

        if (header.classList.contains('asc')) {
            sortedRows.reverse();
            header.classList.remove('asc');
            header.classList.add('desc');
        } else {
            header.classList.remove('desc');
            header.classList.add('asc');
        }

        const tbody = table.querySelector('tbody');
        tbody.innerHTML = '';
        sortedRows.forEach(row => tbody.appendChild(row));
    });
});

// Load saved settings
if (localStorage.getItem('theme') === 'dark') {
    document.body.classList.add('dark');
}
if (localStorage.getItem('themeColor')) {
    document.documentElement.style.setProperty('--theme-color', localStorage.getItem('themeColor'));
}
if (localStorage.getItem('fontFamily')) {
    document.documentElement.style.setProperty('--font-family', localStorage.getItem('fontFamily'));
}
if (localStorage.getItem('animations') === 'false') {
    document.body.classList.add('no-animations');
}
if (localStorage.getItem('sidebarState') === 'collapsed') {
    document.querySelector('.sidebar').classList.add('collapsed');
}

// Sidebar toggle for mobile
document.querySelector('.logo-details').addEventListener('click', function() {
    if (window.innerWidth <= 768) {
        document.querySelector('.sidebar').classList.toggle('collapsed');
    }
});

// Initialize charts on analytics or dashboard page
if (window.location.pathname.includes('analytics.html') || window.location.pathname.includes('admin.html')) {
    window.addEventListener('load', initCharts);
}