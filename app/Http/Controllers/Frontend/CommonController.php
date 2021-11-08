<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Models\State;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use \Exception;
use Illuminate\Support\Facades\Session;

class CommonController extends Controller
{
    public function checkAccountLoginStatus():JsonResponse
    {
        try {
            if (auth()->check()) {
                return response()->json(['success' => true, 'message' => 'Account Login Status True Found', 'payload' => true]);
            } else {
                return response()->json(['success' => true, 'message' => 'Account Login Status False Found', 'payload' => false]);
            }
        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);
        }

    }

    public function getCountryId(Request $request):JsonResponse
    {
        try {
            $country = Country::where('id', $request->id)->first();
            return response()->json(['success' => true, 'message' => 'Country Information', 'payload' => $country]);
        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);
        }

    }


    public function isAccountShippingAddressAvailable(): JsonResponse
    {
        try {
            $accountShippings = auth()->user()->account->accountShippings;
            return response()->json(['success' => true, 'message' => 'Account Shipping Address Information', 'payload' => $accountShippings]);
        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);
        }

    }

    public function isGuestShippingAddressAvailable(): JsonResponse
    {
        try {
            if (Session::has('guest_shipping_address')) {
                return response()->json(['success' => true, 'message' => 'Guest Shipping Address Information', 'payload' => Session::get('guest_shipping_address')]);
            }
            return response()->json(['success' => true, 'message' => 'Guest Shipping Address Information', 'payload' => null]);
        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);
        }
    }

    public function getStatesByCountryId(Request $request): JsonResponse
    {
        try {
            $states = State::where('country_id', $request->country_id)->get();
            return response()->json(['success' => true, 'message' => 'States Information', 'payload' => $states]);
        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);
        }

    }
}
