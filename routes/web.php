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
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\SearchController;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\ProductDetailController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

Route::get('/', function () {
    $productList = DB::table('products')->get();
    $categories = DB::table('categories')->get();
    $bannerList = DB::table('banners')->get();
    return view('welcome', compact('productList', 'categories', 'bannerList'));
})->name('welcome');


Route::get('/account', function () {
    return "Page Account";
});

Route::get('/checkout', function () {
    $categories = \DB::table('categories')->get();
    $cartList = session('cartList') ?? collect(); // hoặc lấy từ DB nếu có user
    return view('checkout', compact('categories', 'cartList'));
})->name('checkout');


Route::get('/product-details', function () {
    $categories = DB::table('categories')->get();
    return view('product_detail', compact('categories')); 
},);

Route::get('/product-details', [ProductDetailController::class, 'product_details'])->name('product_details');

Route::get('/products',[ProductController::class, 'products'])->name('products');
Route::get('/cart',[CartsController::class, 'index'])->name('cart');
Route::get('/reviews', [ReviewsController::class, 'reviews'])->name('reviews');
Route::post('/cart/add',[CartsController::class, 'addToCart'])->name('cart.add');

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);

Route::get('/register', [AuthController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);

Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/profile', function() {
    return view('profile');
})->middleware('auth')->name('profile');

Route::put('/profile', function(Request $request) {
    $user = Auth::user();
    $user->update($request->only(['name', 'email', 'phone', 'address']));
    return redirect()->back()->with('success', 'Cập nhật thông tin thành công!');
})->middleware('auth')->name('profile.update');

Route::put('/put', function() {
    return 'Method PUT';
});


Route::post('/post', function () {
    return "Method post"; 
});

Route::get('/admin', function() {
    return view('admin.admin');
})->middleware('auth', 'check.admin');

Route::get('/admin-analytics', function() {
    return view('admin.analytics');
})->middleware('auth', 'check.admin');

Route::get('/admin-customers', function() {
    return view('admin.customers');
})->middleware('auth', 'check.admin');

Route::get('/admin-login', function() {
    return view('admin.login');
});

Route::get('/admin-orders', function() {
    return view('admin.login');
})->middleware('auth', 'check.admin');

Route::get('/admin-products', function() {
    return view('admin.products');
})->middleware('auth', 'check.admin');

Route::resource('orders', OrderController::class);
Route::resource('order_items', OrderItemController::class);
Route::resource('payments', paymentsController::class);
Route::resource('product_images', productImagesController::class);
Route::resource('shipping', ShippingController::class);
Route::resource('categories', CategoryController::class);
Route::get('/search', [SearchController::class, 'search'])->name('search');
Route::get('/products/{id}/detail', [ProductDetailController::class, 'show'])->name('products.detail');