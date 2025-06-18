<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\shipping>
 */
class shippingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'order_id' => 1,
            'carrier' => $this->faker->company(),
            'tracking_number' => $this->faker->uuid(),
            'status' => $this->faker->randomElement(['processing', 'shipped', 'delivered']),
        ];
    }
}
