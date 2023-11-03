<?php

namespace Database\Factories;

use App\Models\Post;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Coment>
 */
class ComentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'idUser' => User::inRandomOrder()->first(),
            'idPost' => Post::inRandomOrder()->first(),
            'content' => $this->faker->text(255),
            'status' => rand(0,1),
        ];
    }
}
