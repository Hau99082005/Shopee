<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Banner>
 */
class BannerFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => $this->faker->sentence(3),
            'description' => $this->faker->paragraph(),
            'image_url' => $this->faker->imageUrl(1200, 400, 'business'),
            'link_url' => $this->faker->url(),
            'status' => $this->faker->randomElement(['active', 'inactive']),
            'sort_order' => $this->faker->numberBetween(0, 100),
            'start_date' => $this->faker->optional()->dateTimeBetween('-1 month', '+1 month'),
            'end_date' => $this->faker->optional()->dateTimeBetween('+1 month', '+3 months'),
        ];
    }

    /**
     * Indicate that the banner is active.
     */
    public function active(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'active',
        ]);
    }

    /**
     * Indicate that the banner is inactive.
     */
    public function inactive(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'inactive',
        ]);
    }
} 