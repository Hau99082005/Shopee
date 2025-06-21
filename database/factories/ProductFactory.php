<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $productNames = [
            'Điện thoại iPhone 15 Pro Max',
            'Laptop Dell Inspiron 15',
            'Tai nghe AirPods Pro',
            'Đồng hồ thông minh Apple Watch',
            'Máy tính bảng iPad Air',
            'Loa Bluetooth JBL Flip',
            'Camera Canon EOS R5',
            'Bàn phím cơ Logitech G Pro',
            'Chuột gaming Razer DeathAdder',
            'Màn hình LG 27 inch 4K',
            'Ổ cứng SSD Samsung 1TB',
            'RAM Kingston 16GB DDR4',
            'Card đồ họa RTX 4080',
            'Bàn gaming Secretlab Titan',
            'Ghế gaming DXRacer',
            'Microphone Blue Yeti',
            'Webcam Logitech C920',
            'Router WiFi TP-Link Archer',
            'Điều hòa Daikin Inverter',
            'Tủ lạnh Samsung Side by Side'
        ];

        $categories = [1, 2, 3, 4, 5]; // Assuming we have 5 categories

        return [
            'name' => $this->faker->randomElement($productNames),
            'image' => 'products/product-' . $this->faker->numberBetween(1, 5) . '.jpg',
            'description' => $this->faker->realText(200),
            'price' => $this->faker->randomFloat(0, 10000, 9999999),
            'stock' => $this->faker->numberBetween(10, 500),
            'seller_id' => 1,
            'category_id' => $this->faker->randomElement($categories),
        ];
    }
}