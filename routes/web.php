<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome'); // Trả về view welcome.blade.php
});

Route::get('/cart', function () {
    return "Page Cart";
});

Route::get('/account', function () {
    return "Page Account";
});

Route::get('/admin', function () {
    return "Page Admin";
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

Route::post('/post', function () {
    return "Method post"; 
});