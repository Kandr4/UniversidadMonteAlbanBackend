<?php
use App\Http\Controllers\Api\V1\UserController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\TestimonialController;
use App\Http\Controllers\PostController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//Route::apiResource('v1/users', App\Http\Controllers\Api\V1\UserController::class)->only('show');

Route::post('login', [
    App\Http\Controllers\Api\LoginController::class,
    'login'
]);

Route::get('slider', [
    App\Http\Controllers\Api\sliderController::class,
    'showSlider'
]);

Route::controller(App\Http\Controllers\Api\ComentController::class)->group(function () {
    Route::get('coment/{id_post}', 'obtenerComentarios');
    Route::post('coment', 'addComent');
    Route::post('coment/edit/{id_coment}', 'editComent');
    Route::post('coment/delete/{id_coment}', 'deleteComent');
});

Route::controller(App\Http\Controllers\Api\TestimonialController::class)->group(function () {
    Route::get('testimonial', 'getTestimonials');
    Route::get('testimonials/', 'search');
    Route::post('testimonial', 'createTestimonial');
});

Route::controller(App\Http\Controllers\Api\PostController::class)->group(function () {
    Route::post('post', 'createPost');
    Route::post('nose', 'panas');
    
});
