<?php

use App\Http\Controllers\CartsController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;


Route::resource('users', UserController::class);
Route::resource('carts', CartsController::class);
Route::resource('products', ProductController::class);