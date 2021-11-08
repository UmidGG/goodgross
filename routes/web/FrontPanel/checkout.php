<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Frontend\CheckoutController;

Route::get('checkout', [CheckoutController::class, 'loadCheckout']);

Route::get('checkout/get/items', [CheckoutController::class, 'getItems']);

Route::get('checkout/get/account/shipping/addresses', [CheckoutController::class, 'getAccountShippingAddresses']);
Route::get('checkout/get/guest/shipping/address', [CheckoutController::class, 'getGuestShippingAddress']);
Route::get('checkout/select/account/shipping/address', [CheckoutController::class, 'selectAccountShippingAddress']);
Route::get('checkout/delete/account/shipping/address', [CheckoutController::class, 'deleteAccountShippingAddress']);
Route::get('checkout/get/account/shipping/address/by/id', [CheckoutController::class, 'getAccountShippingAddressById']);
Route::post('checkout/save/account/shipping/address', [CheckoutController::class, 'saveAccountShippingAddress']);
Route::post('checkout/save/guest/shipping/address', [CheckoutController::class, 'saveGuestShippingAddress']);

Route::get('checkout/get/account/billing/address', [CheckoutController::class, 'getAccountBillingAddress']);
Route::get('checkout/get/guest/billing/address', [CheckoutController::class, 'getGuestBillingAddress']);
Route::get('checkout/get/account/billing/address/by/id', [CheckoutController::class, 'getAccountBillingAddressById']);
Route::post('checkout/save/account/billing/address', [CheckoutController::class, 'saveAccountBillingAddress']);
Route::post('checkout/save/guest/billing/address', [CheckoutController::class, 'saveGuestBillingAddress']);



Route::get('checkout/get/account/cards', [CheckoutController::class, 'getAccountCards']);
Route::get('checkout/get/account/card/by/id', [CheckoutController::class, 'getAccountCardById']);
Route::get('checkout/delete/account/card', [CheckoutController::class, 'deleteAccountCard']);
Route::get('checkout/select/account/card', [CheckoutController::class, 'selectAccountCard']);
Route::post('checkout/save/account/card', [CheckoutController::class, 'saveAccountCard']);
Route::get('checkout/get/guest/card', [CheckoutController::class, 'getGuestCard']);
Route::post('checkout/save/guest/card', [CheckoutController::class, 'saveGuestCard']);
Route::get('checkout/delete/guest/card', [CheckoutController::class, 'deleteGuestCard']);


Route::post('checkout', [CheckoutController::class, 'processCheckout']);
Route::get('checkout/initiate/paypal', [CheckoutController::class, 'initiatePaypal']);
Route::get('checkout/initiate/stripe', [CheckoutController::class, 'initiateStripe']);
Route::get('checkout/paypal/payment/status', [CheckoutController::class, 'paypalPaymentStatus']);
Route::get('checkout/paypal/payment/cancel', [CheckoutController::class, 'paypalPaymentCancel']);
Route::get('checkout/success', [CheckoutController::class, 'success']);
