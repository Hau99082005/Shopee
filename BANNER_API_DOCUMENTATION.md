# Banner API Documentation

## Tổng quan
API Banner cung cấp các endpoint để quản lý banner trong hệ thống Shopee.

## Base URL
```
http://your-domain.com/api
```

## Endpoints

### 1. Lấy danh sách tất cả banners
**GET** `/banners`

**Query Parameters:**
- `status` (optional): Filter theo status (`active` hoặc `inactive`)
- `active_only` (optional): Chỉ lấy banner đang hoạt động (`true` hoặc `false`)

**Response:**
```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "title": "Khuyến mãi mùa hè",
            "description": "Giảm giá lên đến 50%",
            "image_url": "/assets/images/banner1.png",
            "link_url": "/products?category=summer",
            "status": "active",
            "sort_order": 1,
            "start_date": "2024-01-01T00:00:00.000000Z",
            "end_date": "2024-03-01T00:00:00.000000Z",
            "created_at": "2024-01-01T00:00:00.000000Z",
            "updated_at": "2024-01-01T00:00:00.000000Z"
        }
    ],
    "message": "Banners retrieved successfully"
}
```

### 2. Lấy banner theo ID
**GET** `/banners/{id}`

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "title": "Khuyến mãi mùa hè",
        "description": "Giảm giá lên đến 50%",
        "image_url": "/assets/images/banner1.png",
        "link_url": "/products?category=summer",
        "status": "active",
        "sort_order": 1,
        "start_date": "2024-01-01T00:00:00.000000Z",
        "end_date": "2024-03-01T00:00:00.000000Z",
        "created_at": "2024-01-01T00:00:00.000000Z",
        "updated_at": "2024-01-01T00:00:00.000000Z"
    },
    "message": "Banner retrieved successfully"
}
```

### 3. Tạo banner mới
**POST** `/banners`

**Request Body:**
```json
{
    "title": "Banner mới",
    "description": "Mô tả banner",
    "image_url": "/assets/images/banner.jpg",
    "link_url": "/products",
    "status": "active",
    "sort_order": 1,
    "start_date": "2024-01-01",
    "end_date": "2024-03-01"
}
```

**Validation Rules:**
- `title`: required, string, max 255 characters
- `description`: optional, string
- `image_url`: required, string, max 500 characters
- `link_url`: optional, string, max 500 characters
- `status`: optional, enum (active, inactive)
- `sort_order`: optional, integer, min 0
- `start_date`: optional, date
- `end_date`: optional, date, must be after start_date

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 2,
        "title": "Banner mới",
        "description": "Mô tả banner",
        "image_url": "/assets/images/banner.jpg",
        "link_url": "/products",
        "status": "active",
        "sort_order": 1,
        "start_date": "2024-01-01T00:00:00.000000Z",
        "end_date": "2024-03-01T00:00:00.000000Z",
        "created_at": "2024-01-01T00:00:00.000000Z",
        "updated_at": "2024-01-01T00:00:00.000000Z"
    },
    "message": "Banner created successfully"
}
```

### 4. Cập nhật banner
**PUT/PATCH** `/banners/{id}`

**Request Body:** (tương tự như tạo mới, nhưng tất cả fields đều optional)

**Response:**
```json
{
    "success": true,
    "data": {
        "id": 1,
        "title": "Banner đã cập nhật",
        "description": "Mô tả mới",
        "image_url": "/assets/images/banner-updated.jpg",
        "link_url": "/products",
        "status": "active",
        "sort_order": 2,
        "start_date": "2024-01-01T00:00:00.000000Z",
        "end_date": "2024-03-01T00:00:00.000000Z",
        "created_at": "2024-01-01T00:00:00.000000Z",
        "updated_at": "2024-01-01T00:00:00.000000Z"
    },
    "message": "Banner updated successfully"
}
```

### 5. Xóa banner
**DELETE** `/banners/{id}`

**Response:**
```json
{
    "success": true,
    "message": "Banner deleted successfully"
}
```

### 6. Lấy danh sách banner đang hoạt động
**GET** `/banners/active`

**Response:**
```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "title": "Khuyến mãi mùa hè",
            "description": "Giảm giá lên đến 50%",
            "image_url": "/assets/images/banner1.png",
            "link_url": "/products?category=summer",
            "status": "active",
            "sort_order": 1,
            "start_date": "2024-01-01T00:00:00.000000Z",
            "end_date": "2024-03-01T00:00:00.000000Z",
            "created_at": "2024-01-01T00:00:00.000000Z",
            "updated_at": "2024-01-01T00:00:00.000000Z"
        }
    ],
    "message": "Active banners retrieved successfully"
}
```

### 7. Cập nhật thứ tự banner
**POST** `/banners/update-order`

**Request Body:**
```json
{
    "banners": [
        {
            "id": 1,
            "sort_order": 3
        },
        {
            "id": 2,
            "sort_order": 1
        },
        {
            "id": 3,
            "sort_order": 2
        }
    ]
}
```

**Response:**
```json
{
    "success": true,
    "message": "Banner order updated successfully"
}
```

## Error Responses

### Validation Error (422)
```json
{
    "success": false,
    "message": "Validation failed",
    "errors": {
        "title": ["The title field is required."],
        "image_url": ["The image url field is required."]
    }
}
```

### Not Found Error (404)
```json
{
    "success": false,
    "message": "Banner not found"
}
```

## Database Schema

### Bảng `banners`
| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| title | varchar(255) | Tiêu đề banner |
| description | text | Mô tả banner |
| image_url | varchar(500) | URL hình ảnh banner |
| link_url | varchar(500) | URL liên kết khi click |
| status | enum | Trạng thái (active/inactive) |
| sort_order | int | Thứ tự hiển thị |
| start_date | timestamp | Ngày bắt đầu hiển thị |
| end_date | timestamp | Ngày kết thúc hiển thị |
| created_at | timestamp | Thời gian tạo |
| updated_at | timestamp | Thời gian cập nhật |

## Sử dụng

### Chạy migration
```bash
php artisan migrate
```

### Chạy seeder để tạo dữ liệu mẫu
```bash
php artisan db:seed --class=BannerSeeder
```

### Tạo dữ liệu mẫu với Factory
```bash
php artisan tinker
```
```php
App\Models\Banner::factory()->count(10)->create();
``` 