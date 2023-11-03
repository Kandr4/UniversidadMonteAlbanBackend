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
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
            'role' => 2,
            'verified' => true,
            'cookie' => Str::random(40),
            'remember_token' => Str::random(10),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'Gixarde3',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
            'role' => 2,
            'verified' => true,
            'cookie' => Str::random(40),
            'remember_token' => Str::random(10),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'superAdmin',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
            'role' => 3,
            'verified' => true,
            'cookie' => Str::random(40),
            'remember_token' => Str::random(10),
        ]);
        
        \App\Models\User::factory()->create([
            'username' => 'normalUser',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
            'role' => 1,
            'verified' => true,
            'cookie' => Str::random(40),
            'remember_token' => Str::random(10),
        ]);

        \App\Models\Post::factory(10)->create();
        \App\Models\Coment::factory(20)->create();
        \App\Models\Testimonial::factory(5)->create();
        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
