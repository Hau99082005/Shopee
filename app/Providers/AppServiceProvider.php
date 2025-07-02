<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use App\Models\carts;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer('*', function ($view) {
            $view->with('categories', Category::all());
            $cartList = collect();
            if (Auth::check()) {
                $cartList = carts::with('product')->where('user_id', Auth::id())->get();
            }
            $view->with('cartList', $cartList);
        });
    }
}
