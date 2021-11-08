<?php
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\Frontend\PostProductController;

Route::get('post/product', [PostProductController::class, 'loadPostingProduct']);
Route::get('post/product/get/categories/by/category/type/id', [PostProductController::class, 'getCategoriesByCategoryTypeId']);
Route::get('post/product/get/child/categories/by/category/id', [PostProductController::class, 'getChildCategoriesByCategoryId']);
Route::post('post/product/upload/file', [PostProductController::class, 'uploadFile']);
Route::post('post/product/remove/uploaded/file', [PostProductController::class, 'removeUploadedFile']);
Route::post('post/product', [PostProductController::class, 'postProduct']);
