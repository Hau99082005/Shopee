<?php

use App\Http\Controllers\CartsController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewsController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

// API Routes cho Products
Route::prefix('products')->group(function () {
    Route::get('/', [ProductController::class, 'apiIndex']); // Lấy danh sách sản phẩm
    Route::get('/{id}', [ProductController::class, 'apiShow']); // Lấy chi tiết sản phẩm
    Route::post('/', [ProductController::class, 'apiStore']); // Tạo sản phẩm mới
    Route::put('/{id}', [ProductController::class, 'apiUpdate']); // Cập nhật sản phẩm
    Route::delete('/{id}', [ProductController::class, 'apiDestroy']); // Xóa sản phẩm
    Route::get('/search/{keyword}', [ProductController::class, 'apiSearch']); // Tìm kiếm sản phẩm
    Route::get('/category/{categoryId}', [ProductController::class, 'apiGetByCategory']); // Lấy sản phẩm theo danh mục
});

// API Routes cho Categories
Route::prefix('categories')->group(function () {
    Route::get('/', [CategoryController::class, 'apiIndex']); // Lấy danh sách danh mục
    Route::get('/{id}', [CategoryController::class, 'apiShow']); // Lấy chi tiết danh mục
    Route::post('/', [CategoryController::class, 'apiStore']); // Tạo danh mục mới
    Route::put('/{id}', [CategoryController::class, 'apiUpdate']); // Cập nhật danh mục
    Route::delete('/{id}', [CategoryController::class, 'apiDestroy']); // Xóa danh mục
    Route::get('/{id}/products', [CategoryController::class, 'apiGetProducts']); // Lấy sản phẩm của danh mục
});

// API Routes cho Product Details
Route::prefix('product-details')->group(function () {
    Route::get('/', [App\Http\Controllers\ProductDetailController::class, 'apiIndex']);
    Route::get('/{id}', [App\Http\Controllers\ProductDetailController::class, 'apiShow']);
    Route::post('/', [App\Http\Controllers\ProductDetailController::class, 'apiStore']);
    Route::put('/{id}', [App\Http\Controllers\ProductDetailController::class, 'apiUpdate']);
    Route::delete('/{id}', [App\Http\Controllers\ProductDetailController::class, 'apiDestroy']);
});

Route::resource('users', UserController::class);
Route::resource('carts', CartsController::class);
Route::resource('reviews', ReviewsController::class);
// Route::resource('categories', CategoryController::class)->names([
//     'index' => 'api.categories.index',
//     'store' => 'api.categories.store',
//     'show' => 'api.categories.show',
//     'update' => 'api.categories.update',
//     'destroy' => 'api.categories.destroy',
//     'create' => 'api.categories.create',
//     'edit' => 'api.categories.edit',
// ]);