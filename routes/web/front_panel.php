<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Frontend\HomeController;
use \App\Http\Controllers\Frontend\ProductController;

use \App\Http\Controllers\Frontend\PlaceOrderController;
use \App\Http\Controllers\Frontend\SignInController;
use \App\Http\Controllers\Frontend\RegistrationController;
use \App\Http\Controllers\Frontend\EmailVerificationController;


Route::group([], __DIR__ . '/FrontPanel/common.php');
Route::group([], __DIR__ . '/FrontPanel/checkout.php');
Route::group([], __DIR__ . '/FrontPanel/cart.php');
Route::group([], __DIR__ . '/FrontPanel/deliver_address.php');
Route::group([], __DIR__ . '/FrontPanel/post_product.php');

////////////////////////////////////////////////////////////HOME PAGE////////////////////////////////////////////////////////////////////////////////
Route::get('/', [HomeController::class, 'loadHomePage']);
Route::get('get/category/types', [HomeController::class, 'getCategoryTypes']);

////////////////////////////////////////////////////////////PRODUCT////////////////////////////////////////////////////////////////////////////////
Route::get('category/{category_id}', [ProductController::class, 'loadCategorizedProducts']);
Route::get('category/get/categorized/products', [ProductController::class, 'getCategorizedProducts']);
Route::get('category/get/filter/items', [ProductController::class, 'getFilterItems']);
Route::get('product/{product_id}', [ProductController::class, 'loadProduct']);
Route::get('product/add/to/cart', [ProductController::class, 'addToCart']);
Route::get('product/add/to/watch', [ProductController::class, 'addToWatch']);
Route::post('product/add/to/session', [ProductController::class, 'addWholesaleItemToSession']);



/////////////////////////////////////////////////////////////////Place an Order////////////////////////////////////////////////////
Route::get('place/order', [PlaceOrderController::class, 'index']);




////////////////////////////////////////////////////////////ACCOUNT SIGN IN AND SIGN OUT////////////////////////////////////////////////////////////////////////////////
Route::get('account/sign/in', [SignInController::class, 'loadAccountSignIn']);
Route::post('authenticate/account/sign/in', [SignInController::class, 'authenticateAccountSignIn']);

Route::get('auth/redirect/to/{provider}/{where_to}', [SignInController::class, 'redirectToProvider']);
Route::get('auth/{provider}/callback', [SignInController::class, 'handleProviderCallback']);

Route::get('account/sign/out', [SignInController::class, 'accountSignOut'])->middleware('redirect.to.dashboard.if.authenticated');

////////////////////////////////////////////////////////////CONTROL PANEL SIGN IN AND SIGN OUT////////////////////////////////////////////////////////////////////////////////
Route::get('control/panel/sign/in', [SignInController::class, 'loadControlPanelSignIn']);
Route::post('authenticate/control/panel/sign/in', [SignInController::class, 'authenticateControlPanelSignIn']);

////////////////////////////////////////////////////////////ACCOUNT REGISTRATION////////////////////////////////////////////////////////////////////////////////
Route::get('registration/{id?}', [RegistrationController::class, 'loadRegistration']);
Route::post('register/personal/account', [RegistrationController::class, 'registerPersonalAccount']);
Route::post('register/business/account', [RegistrationController::class, 'registerBusinessAccount']);

////////////////////////////////////////////////////////////ACCOUNT VERIFICATION////////////////////////////////////////////////////////////////////////////////
Route::get('email/verification/{account_id}', [EmailVerificationController::class, 'loadEmailVerification']);
Route::post('verify/email', [EmailVerificationController::class, 'verifyEmail']);

////////////////////////////////////////////////////////////FORGOTTEN PASSWORD////////////////////////////////////////////////////////////////////////////////
Route::get('forgotten/password', [SignInController::class, 'loadForgottenPassword']);
Route::post('send/verification/code', [EmailVerificationController::class, 'sendVerificationCode']);

Route::post('resetting/password', [SignInController::class, 'loadResettingPassword']);




