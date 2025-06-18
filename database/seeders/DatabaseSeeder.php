<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            ShoppeeSeeder::class,
            ShoppeeCartSeeder::class,
            ShoppeeCategorySeeder::class,
            ShoppeeOrdersSeeder::class,
            ShoppeOrderItemsSeeder::class,
            ShoppeePaymentsSeeder::class,
            ShoppeeReviewsSeeder::class,
            ShoppeeShippingSeeder::class,
            ShoppeeUsersSeeder::class,
        ]);
    }
}