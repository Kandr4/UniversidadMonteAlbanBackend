<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;
use App\Models\Post;
use App\Models\User;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Event>
 */
class EventFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'eventName' => $this->faker->sentence,
            'description' => $this->faker->text(255),
            'date' => Carbon::create(null, 11, rand(1, 31)),
            'type' => rand(1,5),
            'idPost' =>  Post::inRandomOrder()->first(),
            'idUser' => User::inRandomOrder()->first(),
        ];
    }
}
