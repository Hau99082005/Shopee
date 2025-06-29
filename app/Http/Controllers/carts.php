<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;



class CartsController extends Controller
{
    public function index()
    {
        $categories = DB::table('categories')->get();
        $productList = DB::table('products')->get();
        $user = Auth::user();
        $userId = $user ? $user->id : 1;
        $cartList = \App\Models\carts::with('product')->where('user_id', $userId)->get();
        return view('cart', compact('categories', 'productList', 'cartList'));
    }
} 