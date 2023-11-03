<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;
use App\Models\User;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Testimonial>
 */
class TestimonialFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $status=[
            'Student','Teacher','Graduated'
        ];
        return [
            'name' => $this->faker->unique()->name,
            'gender' => 'm',
            'status' => $status[rand(0,2)],
            'content' => 'Frase generica para los testimonios',
            'date' => Carbon::now()->toDateString(),
            'img' => 'imgTestimonio.webp',
            'idUser'=> User::inRandomOrder()->first(),
        ];
    }
}
