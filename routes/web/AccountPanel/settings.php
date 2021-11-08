<?php
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\AccountPanel\SettingsController;

Route::get('account/settings', [SettingsController::class, 'index'])->middleware('redirect.to.dashboard.if.authenticated');
