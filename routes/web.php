<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "Page Home";
})->name('/')->middleware('checkAge');

Route::get('/cart', function () {
    return "Page Cart";
});

Route::get('/account', function () {
    return "Page Account";
});

Route::get('/checkout', function () {
    return "Page Checkout";
});

Route::get('/products', function () {
    return "Page Products";
});

Route::get('/product-details', function () {
    return "Page product-details";
});

Route::get('/login', function() {
    return 'Page Login';
});

Route::get('/register', function() {
    return "Page Register";
});

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
})->middleware('checkAge');