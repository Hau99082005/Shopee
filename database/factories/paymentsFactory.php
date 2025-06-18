<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\payments>
 */
class paymentsFactory extends Factory
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
            'amount' => $this->faker->randomFloat(2, 100, 10000),
            'method' => $this->faker->randomElement(['credit_card', 'bank_transfer', 'momo']),
            'status' => $this->faker->randomElement(['pending', 'completed', 'failed']),
        ];
    }
}
