<?php

use Illuminate\Support\Facades\Route;
use \Illuminate\Support\Facades\Artisan;

use \App\Http\Controllers\Frontend\HomeController;
use \App\Http\Controllers\Frontend\ProductController;
use \App\Http\Controllers\Frontend\SignInController;
use \App\Http\Controllers\Frontend\RegistrationController;
use \App\Http\Controllers\Frontend\EmailVerificationController;
use \App\Http\Controllers\Frontend\PostProductController;

use \App\Http\Controllers\Frontend\DeliveryAddressController;
use \App\Http\Controllers\Frontend\CheckoutController;
use \App\Http\Controllers\Frontend\CartController;
use \App\Http\Controllers\Frontend\PlaceOrderController;





/*=======================================================ADMIN=======================================================*/
use \App\Http\Controllers\ControlPanel\DashboardController;


use \App\Http\Controllers\ControlPanel\Operation\OrderController;
use \App\Http\Controllers\ControlPanel\Operation\AccountController;
use \App\Http\Controllers\ControlPanel\Operation\PostedItemController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::get('save/country/in/db', function() {
    try {
        $string = json_decode(\Illuminate\Support\Facades\Storage::get("public/by-code.json"), true);
        //return dd($string);
        foreach ($string as $key => $value) {
            //return $value['currency']['code'];
            $country = \App\Models\Country::where('code', $key)->first();
            if ($country) {
                $country->flag = $value['image'];
                $country->save();
            }
//            $country->name = $value['name'];
//            $country->code = $value['code'];
//            $country->capital = $value['capital'];
//            $country->region = $value['region'];
//            $country->currency_code = $value['currency']['code'];
//            $country->currency_symbol = $value['currency']['symbol'];
//            $country->flag = $value['flag'];
//            $country->dialling_code = $value['dialling_code'];
//            $country->status = 'Active';
//            $country->save();
        }
        dd('done');
    } catch (Exception $exception) {
        return $exception->getMessage();
    }

});


Route::get('clear', function() {
    Artisan::call('config:clear');
    Artisan::call('cache:clear');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    return response()->json('all cache cleared');
});

Route::group([], __DIR__ . '/web/front_panel.php');
Route::group([], __DIR__ . '/web/account_panel.php');











/////////////////////////////////////////////////////Account Panel///////////////////////////////////////////////////////////////



//Route::get('account/panel/sign/out', [SignInController::class, 'signOut'])->middleware('redirect.to.dashboard.if.authenticated');


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////Control Panel///////////////////////////////////////////////////////////////////////////////////////////

Route::get('control/panel/dashboard', [DashboardController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('get/control/panel/notifications', [\App\Http\Controllers\ControlPanel\DashboardController::class, 'getAdminNotifications'])->middleware('redirect.to.dashboard.if.authenticated');

use \App\Http\Controllers\ControlPanel\Configuration\CategoryTypeController;
Route::get('control/panel/configuration/category/type', [CategoryTypeController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/category/type/get/records/{search_key}/{record_per_page}', [CategoryTypeController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/category/type/get/record', [CategoryTypeController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/type/save/record', [CategoryTypeController::class, 'saveRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/type/apply/bulk/operation', [CategoryTypeController::class, 'applyBulkOperation'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/type/delete/record', [CategoryTypeController::class, 'deleteRecord'])->middleware('redirect.to.dashboard.if.authenticated');

use \App\Http\Controllers\ControlPanel\Configuration\SectionController;
Route::get('control/panel/configuration/section', [SectionController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/section/get/records/{search_key}/{record_per_page}', [SectionController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/section/get/record', [SectionController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/section/save/record', [SectionController::class, 'saveRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/section/apply/bulk/operation', [SectionController::class, 'applyBulkOperation'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/section/delete/record', [SectionController::class, 'deleteRecord'])->middleware('redirect.to.dashboard.if.authenticated');

use \App\Http\Controllers\ControlPanel\Configuration\PropertyController;
Route::get('control/panel/configuration/property', [PropertyController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/property/get/records/{category_type_id}/{search_key}/{record_per_page}', [PropertyController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/property/get/record', [PropertyController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/property/save/record', [PropertyController::class, 'saveRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/property/apply/bulk/operation', [PropertyController::class, 'applyBulkOperation'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/property/delete/record', [PropertyController::class, 'deleteRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/property/get/records/from/section/by/category/type/id', [PropertyController::class, 'getRecordsFromSectionByCategoryTypeId'])->middleware('redirect.to.dashboard.if.authenticated');


use \App\Http\Controllers\ControlPanel\Configuration\CategoryController;
Route::get('control/panel/configuration/category', [CategoryController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/category/get/records/{category_type_id}/{level}/{search_key}/{record_per_page}', [CategoryController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/category/get/record', [CategoryController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/save/record', [CategoryController::class, 'saveRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/apply/bulk/operation', [CategoryController::class, 'applyBulkOperation'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/delete/record', [CategoryController::class, 'deleteRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/configuration/category/update/sequence', [CategoryController::class, 'updateSequence'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/category/get/root/records/by/category/type/id/and/level', [CategoryController::class, 'getRootRecordsByCategoryTypeIdAndLevel'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/configuration/category/get/records/from/section/by/category/type/id', [CategoryController::class, 'getRecordsFromSectionByCategoryTypeId'])->middleware('redirect.to.dashboard.if.authenticated');





use \App\Http\Controllers\ControlPanel\Settings\SalesTaxController;
Route::get('control/panel/settings/sales/tax', [SalesTaxController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/settings/sales/tax/get/records/{search_key}/{record_per_page}', [SalesTaxController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/settings/sales/tax/get/record', [SalesTaxController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/settings/sales/tax/save/record', [SalesTaxController::class, 'saveRecord'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/settings/sales/tax/execute/bulk/add/or/update', [SalesTaxController::class, 'executeBulkAddOrUpdate'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/settings/sales/tax/apply/bulk/operation', [SalesTaxController::class, 'applyBulkOperation'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/settings/sales/tax/delete/record', [SalesTaxController::class, 'deleteRecord'])->middleware('redirect.to.dashboard.if.authenticated');






Route::get('control/panel/operation/account', [AccountController::class, 'index']);
Route::get('control/panel/operation/account/get/records/{search_key}/{record_per_page}', [AccountController::class, 'getRecords']);

Route::get('control/panel/operation/posted/retail/items', [PostedItemController::class, 'loadRetailItems']);
Route::get('control/panel/operation/posted/retail/items/get/records/{search_key}/{record_per_page}', [PostedItemController::class, 'getRetailRecords']);
Route::post('control/panel/operation/posted/retail/items/apply/bulk/operation', [PostedItemController::class, 'applyBulkOperationOnRetailItems']);
Route::post('control/panel/operation/posted/retail/items/change/status', [PostedItemController::class, 'changeStatusOfRetailItem']);

Route::get('control/panel/operation/posted/wholesale/items', [PostedItemController::class, 'loadWholesaleItems']);
Route::get('control/panel/operation/posted/wholesale/items/get/records/{search_key}/{record_per_page}', [PostedItemController::class, 'getWholesaleRecords']);
Route::post('control/panel/operation/posted/wholesale/items/apply/bulk/operation', [PostedItemController::class, 'applyBulkOperationOnWholesaleItems']);
Route::post('control/panel/operation/posted/wholesale/items/change/status', [PostedItemController::class, 'changeStatusOfWholesaleItem']);


Route::get('control/panel/operation/order', [OrderController::class, 'index']);
Route::get('control/panel/operation/order/get/records/{search_key}/{record_per_page}', [OrderController::class, 'getRecords']);
Route::get('control/panel/operation/order/get/order/details/records', [OrderController::class, 'getOrderDetailsRecords']);
Route::post('control/panel/operation/order/payout/to/seller', [OrderController::class, 'payoutToSeller']);





use \App\Http\Controllers\ControlPanel\Miscellaneous\NotificationController;
Route::get('control/panel/miscellaneous/notification', [NotificationController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/miscellaneous/notification/get/records/{search_key}/{record_per_page}', [NotificationController::class, 'getRecords'])->middleware('redirect.to.dashboard.if.authenticated');
Route::get('control/panel/miscellaneous/notification/get/record', [NotificationController::class, 'getRecord'])->middleware('redirect.to.dashboard.if.authenticated');

Route::post('control/panel/miscellaneous/notification/apply/bulk/operation', [NotificationController::class, 'applyBulkOperation'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/miscellaneous/notification/delete/record', [NotificationController::class, 'deleteRecord'])->middleware('redirect.to.dashboard.if.authenticated');




Route::get('control/panel/sign/out', [SignInController::class, 'controlPanelSignOut'])->middleware('redirect.to.dashboard.if.authenticated');
Route::post('control/panel/change/password', 'Admin\DashboardController@changePassword')->middleware('redirect.to.dashboard.if.authenticated');



























Route::fallback(function () {
    return view('Errors.404');
});
