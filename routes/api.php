<?php

use App\Http\Controllers\CartsController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewsController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Api\BannerController;

Route::resource('users', UserController::class);
Route::resource('carts', CartsController::class);
Route::resource('products', ProductController::class);
Route::resource('reviews', ReviewsController::class);
Route::resource('banners', BannerController::class);
Route::resource('categories', CategoryController::class)->names([
    'index' => 'api.categories.index',
    'store' => 'api.categories.store',
    'show' => 'api.categories.show',
    'update' => 'api.categories.update',
    'destroy' => 'api.categories.destroy',
    'create' => 'api.categories.create',
    'edit' => 'api.categories.edit',
]);