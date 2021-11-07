<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SettingsController extends Controller
{
    public function account()
    {
        $title = 'Account Settings';
        $activeNav = 'Account Settings';
        return view('Account.account_settings', compact('title', 'activeNav'));
    }
}
