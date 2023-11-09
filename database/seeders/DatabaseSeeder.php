<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        \App\Models\User::factory()->create([
            'username' => 'Roger',
            'email' => 'roger@gmail.com',
            'name' => 'Rogelio',
            'lastName' => 'Elizalde Diaz',
            'birthdate' => '2003-03-23',
            'password' => 'password',
            'role' => 2,
            'cookie' => Str::random(40),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'Gixarde3',
            'password' => 'Und3rt4le!',
            'email' => 'chavez@gmail.com',
            'name' => 'Marco',
            'lastName' => 'Chávez Rodríguez',
            'birthdate' => '2003-03-23',
            'role' => 2,
            'cookie' => Str::random(40),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'superAdmin',
            'password' => 'password',
            'email' => 'superAdmin@gmail.com',
            'name' => 'Super',
            'lastName' => 'Admin',
            'birthdate' => '2003-03-23',
            'role' => 3,
            'cookie' => Str::random(40),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'normalUser',
            'password' => 'password',
            'email' => 'user@gmail.com',
            'name' => 'User',
            'lastName' => 'Common',
            'birthdate' => '2003-03-23',
            'role' => 1,
            'cookie' => Str::random(40),
        ]);

        \App\Models\Post::factory(10)->create();
        \App\Models\Coment::factory(20)->create();
        \App\Models\Testimonial::factory(5)->create();
        \App\Models\Event::factory(5)->create();
        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
