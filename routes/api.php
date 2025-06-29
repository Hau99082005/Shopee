<?php

use App\Http\Controllers\Api\BannerController;
use App\Http\Controllers\CartsController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductDetailController;
use App\Http\Controllers\productImagesController;
use App\Http\Controllers\ReviewsController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

// Route::resource('banners', BannerController::class); // XÓA HOẶC COMMENT VÌ KHÔNG TỒN TẠI CONTROLLER
Route::resource('product_details', ProductDetailController::class);
Route::resource('users', UserController::class);
Route::resource('carts', CartsController::class);
// Route::resource('product_images', productImagesController::class); // XÓA HOẶC COMMENT VÌ ĐÃ KHAI BÁO Ở WEB.PHP
Route::resource('products', ProductController::class);
Route::resource('reviews', ReviewsController::class);
Route::resource('categories', CategoryController::class)->names([
    'index' => 'api.categories.index',
    'store' => 'api.categories.store',
    'show' => 'api.categories.show',
    'update' => 'api.categories.update',
    'destroy' => 'api.categories.destroy',
    'create' => 'api.categories.create',
    'edit' => 'api.categories.edit',
]);

// Cart API routes (không cần auth để test)
Route::get('/cart', [App\Http\Controllers\CartsController::class, 'apiIndex']);
Route::post('/cart', [App\Http\Controllers\CartsController::class, 'apiStore']);
Route::put('/cart/{id}', [App\Http\Controllers\CartsController::class, 'apiUpdate']);
Route::delete('/cart/{id}', [App\Http\Controllers\CartsController::class, 'apiDestroy']);
Route::delete('/cart', [App\Http\Controllers\CartsController::class, 'apiClear']);

// New smart cart API routes
Route::post('/cart-api/add-or-replace', [CartsController::class, 'apiAddOrReplace']);
Route::post('/cart-api/add-multiple', [CartsController::class, 'apiAddMultiple']);