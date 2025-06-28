<?php

use App\Http\Controllers\CartsController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;


Route::resource('users', UserController::class);
Route::resource('carts', CartsController::class);
Route::resource('products', ProductController::class);

Route::get('/cart-api', [CartsController::class, 'apiIndex']);
Route::post('/cart-api', [CartsController::class, 'apiStore']);
Route::put('/cart-api/{id}', [CartsController::class, 'apiUpdate']);
Route::delete('/cart-api/{id}', [CartsController::class, 'apiDestroy']);
Route::post('/cart-api/cleanup', [CartsController::class, 'apiCleanup']);
Route::delete('/cart-api/clear', [CartsController::class, 'apiClear']);