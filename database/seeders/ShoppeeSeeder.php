<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Shoppee; // Nếu bạn đã tạo model Shoppee

class ShoppeeSeeder extends Seeder
{
    public function run()
    {
        Shoppee::create([
            'name' => 'Shop 1',
            'varchar' => 'Example Owner',
            'owner' => 'owner1',
            'expiration' => 30,
            'shoppee_jobs' => 0,
            'failed_jobs' => 0,
            'options' => 'default options',
            'attempts' => 0,
            'reserved_at' => null,
            'finished_at' => null,
        ]);
    }
}