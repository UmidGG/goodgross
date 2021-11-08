<?php
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Frontend\CartController;

Route::get('cart', [CartController::class, 'index']);
Route::get('cart/get/items', [CartController::class, 'getItems']);
Route::get('cart/delete/item', [CartController::class, 'deleteItem']);
Route::get('cart/update/item/quantity', [CartController::class, 'updateItemQuantity']);
Route::get('cart/copy/items/to/checkout', [CartController::class, 'copyItemToCheckout']);
