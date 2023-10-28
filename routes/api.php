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
