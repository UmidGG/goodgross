<?php
use Illuminate\Support\Facades\Route;

Route::group([], __DIR__ . '/AccountPanel/overview.php');
Route::group([], __DIR__ . '/AccountPanel/settings.php');


Route::get('get/account/notifications', [\App\Http\Controllers\AccountPanel\DashboardController::class, 'getAccountNotifications'])->middleware('redirect.to.dashboard.if.authenticated');



Route::get('account/post/product', [\App\Http\Controllers\AccountPanel\PostProductController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('account/post/product/get/categories/{made_for}', [\App\Http\Controllers\AccountPanel\PostProductController::class, 'getCategories']);
Route::get('account/post/product/get/child/categories/{category_id}', [\App\Http\Controllers\AccountPanel\PostProductController::class, 'getChildCategories']);
Route::post('account/post/product', [\App\Http\Controllers\AccountPanel\PostProductController::class, 'postProduct']);


Route::post('account/change/from/personal/to/business/account', [\App\Http\Controllers\AccountPanel\DashboardController::class, 'changeFromPersonalToBusinessAccount'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('account/change/from/retail/to/wholesale/account', [\App\Http\Controllers\AccountPanel\DashboardController::class, 'changeFromRetailToWholesaleAccount'])->middleware('redirect.to.dashboard.if.authenticated');


Route::get('account/my/posting/{section}', [\App\Http\Controllers\AccountPanel\MyPostingController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');

Route::get('account/my/payment', [\App\Http\Controllers\AccountPanel\MyPaymentController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('account/my/payment/link/connected/account', [\App\Http\Controllers\AccountPanel\MyPaymentController::class, 'linkConnectedAccount'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('account/my/payment/connected/account/refresh/{connected_account_id}', [\App\Http\Controllers\AccountPanel\MyPaymentController::class, 'connectedAccountRefresh'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('account/my/payment/linked/account/success/{connected_account_id}', [\App\Http\Controllers\AccountPanel\MyPaymentController::class, 'linkedAccountSuccess'])->middleware('redirect.to.dashboard.if.authenticated');

Route::get('account/notification', [\App\Http\Controllers\AccountPanel\NotificationController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('account/notification/get/records', [\App\Http\Controllers\AccountPanel\NotificationController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('account/notification/get/record', [\App\Http\Controllers\AccountPanel\NotificationController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');
