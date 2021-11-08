<?php

use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\AccountPanel\OverviewController;


Route::get('account/overview', [OverviewController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
