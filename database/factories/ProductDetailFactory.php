<?php
namespace Database\Factories;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Product;
class ProductDetailFactory extends Factory
{
    public function definition(): array
    {
        return [
            'product_id' => Product::factory(),
            'name' => $this->faker->words(3, true),
            'image' => $this->faker->imageUrl(640, 480, 'products', true),
            'price' => $this->faker->randomFloat(0, 10000, 9999999),
            'price_old' => $this->faker->randomFloat(0,10000,9999999),
            'color' => $this->faker->safeColorName(),
            'size' => $this->faker->randomElement(['S','M','L','XL','XXL']),
            'material' => $this->faker->randomElement(['Cotton','Polyester','Leather','Metal','Plastic']),
            'origin' => $this->faker->country(),
            'warranty' => $this->faker->randomElement(['6 tháng','12 tháng','24 tháng','Không bảo hành']),
            'description' => $this->faker->realText(100),
        ];
    }
} 