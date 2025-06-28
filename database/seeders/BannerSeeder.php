<?php

namespace Database\Seeders;

use App\Models\Banner;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BannerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $banners = [
            [
                'title' => 'Khuyến mãi mùa hè',
                'description' => 'Giảm giá lên đến 50% cho tất cả sản phẩm mùa hè',
                'image_url' => '/assets/images/banner1.png',
                'link_url' => '/products?category=summer',
                'status' => 'active',
                'sort_order' => 1,
                'start_date' => now(),
                'end_date' => now()->addMonths(2),
            ],
            [
                'title' => 'Sản phẩm mới',
                'description' => 'Khám phá những sản phẩm mới nhất từ các thương hiệu hàng đầu',
                'image_url' => '/assets/images/banner2.png',
                'link_url' => '/products?new=true',
                'status' => 'active',
                'sort_order' => 2,
                'start_date' => now(),
                'end_date' => now()->addMonths(1),
            ],
            [
                'title' => 'Flash Sale',
                'description' => 'Chỉ trong 24h - Giảm giá sốc cho điện tử',
                'image_url' => '/assets/images/banner3.png',
                'link_url' => '/products?flash_sale=true',
                'status' => 'active',
                'sort_order' => 3,
                'start_date' => now(),
                'end_date' => now()->addDays(1),
            ],
            [
                'title' => 'Thời trang nam',
                'description' => 'Bộ sưu tập thời trang nam mới nhất',
                'image_url' => '/assets/images/banner4.png',
                'link_url' => '/products?category=men_fashion',
                'status' => 'active',
                'sort_order' => 4,
                'start_date' => now(),
                'end_date' => now()->addMonths(3),
            ],
            [
                'title' => 'Thời trang nữ',
                'description' => 'Xu hướng thời trang nữ 2024',
                'image_url' => '/assets/images/banner5.png',
                'link_url' => '/products?category=women_fashion',
                'status' => 'active',
                'sort_order' => 5,
                'start_date' => now(),
                'end_date' => now()->addMonths(3),
            ],
        ];

        foreach ($banners as $banner) {
            Banner::create($banner);
        }
    }
} 