<?php
use App\Http\Controllers\Api\V1\UserController;
use App\Http\Controllers\Api\LoginController;
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
    Route::put('coment/{id_coment}', 'editComent');
});
