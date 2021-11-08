<?php
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Frontend\DeliveryAddressController;

Route::get('delivery/address', [DeliveryAddressController::class, 'loadDeliveryAddress']);
Route::post('delivery/address/save/account/shipping/address', [DeliveryAddressController::class, 'saveAccountShippingAddress']);
Route::post('delivery/address/save/guest/shipping/address', [DeliveryAddressController::class, 'saveGuestShippingAddress']);
