<?php

use Illuminate\Support\Facades\Route;
Use App\Http\Controllers\Frontend\CommonController;

Route::get('check/account/login/status', [CommonController::class, 'checkAccountLoginStatus']);
Route::get('is/account/shipping/address/available', [CommonController::class, 'isAccountShippingAddressAvailable']);
Route::get('is/guest/shipping/address/available', [CommonController::class, 'isGuestShippingAddressAvailable']);
Route::get('get/country/by/id', [CommonController::class, 'getCountryId']);
Route::get('get/states/by/country/id', [CommonController::class, 'getStatesByCountryId']);
