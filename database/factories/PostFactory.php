<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => $this->faker->sentence,
            'legend' => $this->faker->sentence,
            'description' => $this->faker->text(255),
            'img' => 'image_1.webp',
            'route' => 'Cambia esto perroooooo',
            'idUser' => rand(1,10),
        ];
    }
}
