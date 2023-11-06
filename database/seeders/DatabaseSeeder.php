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
            'password' => 'password',
            'role' => 2,
            'verified' => true,
            'cookie' => Str::random(40),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'Gixarde3',
            'password' => 'Und3rt4le!',
            'role' => 2,
            'verified' => true,
            'cookie' => Str::random(40),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'superAdmin',
            'password' => 'password',
            'role' => 3,
            'verified' => true,
            'cookie' => Str::random(40),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'normalUser',
            'password' => 'password',
            'role' => 1,
            'verified' => true,
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
