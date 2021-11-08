<?php

namespace App\Http\Controllers\AccountPanel;

use App\Http\Controllers\Controller;
use App\Models\Country;
use Illuminate\Http\Request;

class SettingsController extends Controller
{
    public function index()
    {
        $title = 'Account Settings';
        $activeNav = 'Account Settings';
        $countries = Country::where('status', 'Active')->get();
        return view('AccountPanel.settings', compact('title', 'activeNav', 'countries'));
    }
}
