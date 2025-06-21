<?php

use App\Http\Controllers\CartsController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OrderItemController;
use App\Http\Controllers\paymentsController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\productImagesController;
use App\Http\Controllers\ReviewsController;
use App\Http\Controllers\ShippingController;
use App\Http\Middleware\CheckAge;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;

Route::get('/', function () {
    return view('welcome');
})->name('welcome');


Route::get('/account', function () {
    return "Page Account";
});

Route::get('/checkout', function () {
    return "Page Checkout";
});


Route::get('/product-details', function () {
    return "Page product-details";
});

Route::get('/products',[ProductController::class, 'products'])->name('products');
Route::get('/cart',[CartsController::class, 'index'])->name('cart');
Route::post('/cart/add',[CartsController::class, 'addToCart'])->name('cart.add');

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);

Route::get('/register', [AuthController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);

Route::put('/put', function() {
    return 'Method PUT';
});


Route::post('/post', function () {
    return "Method post"; 
});

Route::prefix('admin')->group(function() {
    Route::get('posts/{post}/comments/{comment}', function($postId, $commentId) {
        return "postId: $postId - commentId: $commentId";
    });
    Route::get('user/{name?}', function($name = 'Hau') {
       return $name;
    });
})->middleware(CheckAge::class);

Route::resource('categories', CategoryController::class);
Route::resource('orders', OrderController::class);
Route::resource('order_items', OrderItemController::class);
Route::resource('payments', paymentsController::class);
Route::resource('product_images', productImagesController::class);
Route::resource('reviews', ReviewsController::class);
Route::resource('shipping', ShippingController::class);