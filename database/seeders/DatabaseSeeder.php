<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
         UserSeeder::class,
         CategorySeeder::class,
         ProductSeeder::class,
         OrderSeeder::class,
         OrderItemsSeeder::class,
         cartsSeeder::class,
         paymentsSeeder::class,
         product_imagesSeeder::class,
         reviewsSeeder::class,
         shippingSeeder::class,
        ]);
    }
}