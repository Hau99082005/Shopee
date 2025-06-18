<?php

namespace Database\Seeders;

use App\Models\product_images;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class product_imagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        product_images::factory()->count(10)->create();
    }
}