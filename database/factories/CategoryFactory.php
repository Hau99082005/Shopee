<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{
   
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
  
    public function definition(): array
    
    {
        
        return [
            'name' => $this->faker->word(),
            'image' => $this->faker->imageUrl(),
            'desc' => $this->faker->realText(50),
            'parent_id' => null,
        ];
    }
}