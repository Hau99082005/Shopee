<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\ProductDetail;
class ProductDetailSeeder extends Seeder
{
    public function run(): void
    {
        foreach (Product::all() as $product) {
            ProductDetail::factory()->create([
                'product_id' => $product->id,
                'name' => $product->name,
                'image' => $product->image,
                'price' => $product->price,
                'price_old' => $product->price_old,
            ]);
        }
    }
} 