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
use App\Http\Controllers\SearchController;
use Symfony\Component\HttpKernel\Debug\VirtualRequestStack;
use App\Models\Category;
use Illuminate\Support\Facades\DB;

Route::get('/', function () {
    $productList = DB::table('products')->get();
    $categoryList = DB::table('categories')->get();
    return view('welcome', compact('productList', 'categoryList'));
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
Route::get('/reviews', [ReviewsController::class, 'reviews'])->name('reviews');
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

Route::get('/admin', function() {
    return view('admin.admin');
});

Route::get('/admin-analytics', function() {
    return view('admin.analytics');
});

Route::get('/admin-customers', function() {
    return view('admin.customers');
});

Route::get('/admin-login', function() {
    return view('admin.login');
});

Route::get('/admin-orders', function() {
    return view('admin.login');
});

Route::get('/admin-products', function() {
    return view('admin.products');
});

Route::resource('orders', OrderController::class);
Route::resource('order_items', OrderItemController::class);
Route::resource('payments', paymentsController::class);
Route::resource('product_images', productImagesController::class);
Route::resource('shipping', ShippingController::class);
Route::resource('categories', CategoryController::class);
Route::get('/search', [SearchController::class, 'search'])->name('search');