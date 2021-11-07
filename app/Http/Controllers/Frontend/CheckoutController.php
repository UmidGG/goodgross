<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\CardRequest;
use App\Http\Requests\Frontend\CheckoutRequest;


use App\Http\Requests\Frontend\DeliveryAddressRequest;
use App\Models\Account;
use App\Models\AccountBilling;
use App\Models\AccountCard;
use App\Models\AccountShipping;
use App\Models\Country;
use App\Models\State;
use App\Models\User;
use App\Models\UserNotification;
use App\Models\GuestAccount;
use App\Models\AccountNotification;
use App\Models\Option;
use App\Models\Order;
use App\Models\OrderBilling;
use App\Models\OrderShipping;
use App\Models\OrderTransaction;
use App\Models\Product;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;

use Illuminate\Support\Str;

///////////////////////PayPal////////////////////////////////
use PayPalCheckoutSdk\Orders\OrdersCreateRequest;
use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;

///////////////////////////////////////End of PayPal////////////////////////////

use Stevebauman\Location\Facades\Location;

use Stripe\BaseStripeClient;
use \Stripe\StripeClient;
use \Exception;
use \Stripe\Exception\CardException;
use \Stripe\Exception\RateLimitException;
use \Stripe\Exception\InvalidRequestException;
use \Stripe\Exception\AuthenticationException;
use \Stripe\Exception\ApiConnectionException;
use \Stripe\Exception\ApiErrorException;

class CheckoutController extends Controller
{

    protected $months = [
        '01' => 'January',
        '02' => 'February',
        '03' => 'March',
        '04' => 'April',
        '05' => 'May',
        '06' => 'June',
        '07' => 'July',
        '08' => 'August',
        '09' => 'September',
        '10' => 'October',
        '11' => 'November',
        '12' => 'December',
    ];

    //private $apiContext;

//    public function __construct()
//    {
//        $paypalConf = Config::get('paypal');
//        $this->apiContext = new ApiContext(new OAuthTokenCredential(
//                $paypalConf['client_id'],
//                $paypalConf['secret'])
//        );
//        $this->apiContext->setConfig($paypalConf['settings']);
//
//    }

    public function loadCheckout()
    {
        $title = 'Checkout';
        $checkoutItems =  Session::get('checkout_items');
        $activeNav = 'Checkout';
        if ($position = Location::get(request()->getClientIp())) {
            $userCountry = $position->countryName;
            $userState = $position->regionName;
        } else {
            $userCountry = null;
            $userState = null;
        }
        $countries = Country::where('status', 'Active')->get();
        $states = State::where('status', 'Active')->get();
        $isGuest = false;
        if (auth()->check()) {
            $userAccount = auth()->user()->account;
            $userAccountDetails = auth()->user()->account->type === 'Personal' ? auth()->user()->account->personalAccount : auth()->user()->account->businessAccount;
            return view('Frontend.checkout', compact('title', 'checkoutItems', 'activeNav', 'userCountry', 'userState', 'userAccount', 'userAccountDetails', 'countries', 'states', 'isGuest'));
        } else {
            $isGuest = true;
            return view('Frontend.checkout', compact('title', 'checkoutItems', 'activeNav', 'userCountry', 'userState', 'countries', 'states', 'isGuest'));
        }

    }

    public function getItems(): JsonResponse
    {
        return response()->json(['success' => true, 'message' => 'Checkout Items Fetched Successfully', 'payload' => Session::get('checkout_items')]);
    }



    public function getAccountDeliveryAddresses(): JsonResponse
    {
        $accountShippings = AccountShipping::where('account_id', auth()->user()->account->id)->latest('is_selected')->latest('created_at')->with('country')->get();
        return response()->json(['success' => true, 'message' => 'Delivery Addresses Fetched Successfully', 'payload' => $accountShippings]);
    }

    public function selectAccountDeliveryAddress(Request $request): JsonResponse
    {
        AccountShipping::where('account_id', auth()->user()->account->id)->update(['is_selected' => 0]);
        AccountShipping::where('id', $request->id)->update(['is_selected' => 1]);
        return response()->json(['success' => true, 'message' => 'Delivery Address Selected Successfully', 'payload' => null]);
    }

    public function deleteAccountDeliveryAddress(Request $request): JsonResponse
    {
        AccountShipping::where('id', $request->id)->delete();
        return response()->json(['success' => true, 'message' => 'Delivery Address Deleted Successfully', 'payload' => null]);
    }
    public function getAccountDeliveryAddressById(Request $request): JsonResponse
    {
        $accountShipping = AccountShipping::where('id', $request->id)->with('country')->first();
        return response()->json(['success' => true, 'message' => 'Delivery Address Fetched Successfully', 'payload' => $accountShipping]);
    }

    public function saveAccountDeliveryAddress(DeliveryAddressRequest $request): JsonResponse
    {
        $accountShipping = $request->has('id') ? AccountShipping::find($request->id) : new AccountShipping();
        $accountShipping->account_id = auth()->user()->account->id;
        $accountShipping->first_name = $request->first_name;
        $accountShipping->last_name = $request->last_name;
        $accountShipping->country_id = $request->country_id;
        $accountShipping->state = $request->state;
        $accountShipping->city = $request->city;
        $accountShipping->postal_code = $request->postal_code;
        $accountShipping->address_line_1 = $request->address_line_1;
        $accountShipping->address_line_2 = $request->address_line_2;
        $accountShipping->phone = $request->phone;
        $accountShipping->email = $request->email;
        if ( ! $request->has('id')) {
            AccountShipping::where('account_id', auth()->user()->account->id)->update(['is_selected' => 0]);
            $accountShipping->is_selected = 1;
        }
        $accountShipping->save();
        return response()->json(['success' => true, 'message' => 'Delivery Address Saved Successfully', 'payload' => null]);
    }

    public function getGuestDeliveryAddress(): JsonResponse
    {
        $shippingAddress = Session::get('delivery_address_for_guest');
        return response()->json(['success' => true, 'message' => 'Guest Delivery Address Fetched Successfully', 'payload' => $shippingAddress]);
    }

    public function saveGuestDeliveryAddress(DeliveryAddressRequest $request): JsonResponse
    {
        $deliveryAddress = $request->except(['_token']);
        $deliveryAddress['country'] = Country::where('id', $request->country_id)->first();
        Session::put('delivery_address_for_guest', $deliveryAddress);
        return response()->json(['success' => true, 'message' => 'Delivery Address Saved Successfully', 'payload' => null]);
    }

    public function getAccountBillingAddress(): JsonResponse
    {
        $accountBilling = AccountBilling::where('account_id', auth()->user()->account->id)->with('country')->first();
        return response()->json(['success' => true, 'message' => 'Account Billing Address Fetched Successfully', 'payload' => $accountBilling]);
    }

    public function getGuestBillingAddress(): JsonResponse
    {
        $guestBilling = Session::get('billing_address_for_guest');
        return response()->json(['success' => true, 'message' => 'Guest Billing Address Fetched Successfully', 'payload' => $guestBilling]);
    }

    public function getAccountBillingAddressById(Request $request): JsonResponse
    {
        $accountBilling = AccountBilling::where('id', $request->id)->with('country')->first();
        return response()->json(['success' => true, 'message' => 'Billing Address Fetched Successfully', 'payload' => $accountBilling]);
    }


    public function saveBillingAddressForAccount(DeliveryAddressRequest $request): JsonResponse
    {
        $accountBilling = AccountBilling::find($request->id);
        $accountBilling->account_id = auth()->user()->account->id;
        $accountBilling->first_name = $request->first_name;
        $accountBilling->last_name = $request->last_name;
        $accountBilling->country_id = $request->country_id;
        $accountBilling->state = $request->state;
        $accountBilling->city = $request->city;
        $accountBilling->postal_code = $request->postal_code;
        $accountBilling->address_line_1 = $request->address_line_1;
        $accountBilling->address_line_2 = $request->address_line_2;
        $accountBilling->phone = $request->phone;
        $accountBilling->email = $request->email;
        $accountBilling->save();
        return response()->json(['success' => true, 'message' => 'Billing Address Saved Successfully', 'payload' => null]);
    }

    public function saveBillingAddressForGuest(DeliveryAddressRequest $request): JsonResponse
    {

        $billingAddress = $request->except(['_token']);
        $billingAddress['country'] = Country::where('id', $request->country_id)->first();
        Session::put('billing_address_for_guest', $billingAddress);
        return response()->json(['success' => true, 'message' => 'Billing Address Saved Successfully', 'payload' => null]);
    }

    public function getAccountCards(): JsonResponse
    {
        $accountCards = AccountCard::where('account_id', auth()->user()->account->id)->latest('is_selected')->latest('created_at')->get();
        return response()->json(['success' => true, 'message' => 'Account Cards Fetched Successfully', 'payload' => $accountCards]);
    }

    public function getAccountCardById(Request $request)
    {
        return response()->json(['success' => true, 'message' => 'Account Card Fetched Successfully', 'payload' => AccountCard::where('id', $request->id)->first()]);
    }

    public function deleteCardFromAccount(Request $request)
    {
        $accountCard = AccountCard::where('id', $request->id)->first();
        AccountCard::where('id', $request->id)->delete();
        if ($accountCard->is_selected === 1) {
            if (AccountCard::where('account_id', auth()->user()->account->id)->get()->isNotEmpty()) {
                AccountCard::where('account_id', auth()->user()->account->id)->latest()->first()->update(['is_selected' => 1]);
            }
        }
        return response()->json(['success' => true, 'message' => 'Card Deleted Successfully', 'payload' => null]);
    }

    public function selectCardForAccount(Request $request): JsonResponse
    {
        AccountCard::where('account_id', auth()->user()->account->id)->update(['is_selected' => 0]);
        AccountCard::where('id', $request->id)->update(['is_selected' => 1]);
        return response()->json(['success' => true, 'message' => 'Card Selected Successfully', 'payload' => null]);
    }

    public function saveCardForAccount(CardRequest $request): JsonResponse
    {

        $stripeConf = Config::get('stripe');
        $stripe = new StripeClient(
            $stripeConf['secret']
        );

        try {
            $token = $stripe->tokens->create([
                'card' => [
                    'number' => $request->card_number,
                    'exp_month' => array_keys($this->months, $request->expiry_month)[0],
                    'exp_year' => $request->expiry_year,
                    'cvc' => $request->security_code,
                ],
            ]);
            if (!isset($token->id)) {
                return response()->json(['success' => false, 'message' => 'Token Generation Failed', 'payload' => null]);
            }

            if ( ! $request->has('id')) {
                AccountCard::where('account_id', auth()->user()->account->id)->update(['is_selected' => 0]);
            }

            $accountCard = $request->has('id') ? AccountCard::find($request->id) : new AccountCard();
            if ( ! $request->has('id')) {
                $accountCard->account_id = auth()->user()->account->id;
                $accountCard->first_name = $request->first_name;
                $accountCard->last_name = $request->last_name;
                $accountCard->card_number = $request->card_number;
                $accountCard->card_brand = $token->card->brand;
                $accountCard->is_selected = 1;
            }
            $accountCard->security_code = $request->security_code;
            $accountCard->expiry_month = $request->expiry_month;
            $accountCard->expiry_year = $request->expiry_year;
            $accountCard->save();
            return response()->json(['success' => true, 'message' => 'Card Saved Successfully', 'payload' => $accountCard]);


        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);

        }

    }

    public function getGuestCard(): JsonResponse
    {
        $cardForGuest = Session::has('card_for_guest') ? Session::get('card_for_guest') : null;
        return response()->json(['success' => true, 'message' => 'Guest Card Fetched Successfully', 'payload' => $cardForGuest]);
    }

    public function deleteGuestCard()
    {
        Session::forget('card_for_guest');
        return response()->json(['success' => true, 'message' => 'Guest Card Deleted Successfully', 'payload' => null]);
    }

    public function saveCardForGuest(CardRequest $request): JsonResponse
    {
        $stripeConf = Config::get('stripe');
        $stripe = new StripeClient(
            $stripeConf['secret']
        );

        try {
            $token = $stripe->tokens->create([
                'card' => [
                    'number' => $request->card_number,
                    'exp_month' => array_keys($this->months, $request->expiry_month)[0],
                    'exp_year' => $request->expiry_year,
                    'cvc' => $request->security_code,
                ],
            ]);
            if (!isset($token->id)) {
                return response()->json(['success' => false, 'message' => 'Token Generation Failed', 'payload' => null]);
            }
            $guestCard = $request->except(['_token']);
            $guestCard['card_brand'] = $token->card->brand;
            Session::forget('card_for_guest');
            Session::put('card_for_guest', $guestCard);
            return response()->json(['success' => true, 'message' => 'Card Saved Successfully', 'payload' => $guestCard]);

        } catch (Exception $exception) {
            return response()->json(['success' => false, 'message' => $exception->getMessage(), 'payload' => null]);
        }
    }

    public function getCountryId(Request $request)
    {
        $country = Country::where('id', $request->id)->first();
        return response()->json(['success' => true, 'message' => 'Country Information', 'payload' => $country]);
    }


    public function isShippingAddressAvailable(): JsonResponse
    {
        $accountShippings = auth()->user()->account->accountShippings;
        return response()->json(['success' => true, 'message' => 'Shipping Address Information', 'payload' => $accountShippings]);
    }

    public function isGuestDeliveryAddressExist(): JsonResponse
    {
        if (Session::has('delivery_address_for_guest')) {
            return response()->json(['success' => true, 'message' => 'Guest Delivery Address Information', 'payload' => Session::get('delivery_address_for_guest')]);
        }
        return response()->json(['success' => true, 'message' => 'Guest Delivery Address Information', 'payload' => null]);
    }


    public function processCheckout(CheckoutRequest $request): JsonResponse
    {
        if ($request->payment_option === 'PayPal') {
            $this->initiatePaypal();
        } elseif ($request->payment_option === 'Card') {
            return response()->json($this->processStripe());
        }
    }


    public function processStripe(): array
    {
        $stripeConf = Config::get('stripe');
        $stripe = new StripeClient(
            $stripeConf['secret']
        );

        try {
            $cardInformation = auth()->check() ? AccountCard::where('account_id', auth()->user()->account->id)->where('is_selected', 1)->first() : Session::get('card_for_guest');
            $token = $stripe->tokens->create([
                'card' => [
                    'number' => $cardInformation['card_number'],
                    'exp_month' => intval(array_keys($this->months, $cardInformation['expiry_month'])[0]),
                    'exp_year' => intval($cardInformation['expiry_year']),
                    'cvc' => $cardInformation['security_code'],
                ],
            ]);

            if (!isset($token->id)) {
                return ['success' => false, 'message' => 'Failed to Initiate Payment', 'payload' => null];
            }
            $checkoutItems = Session::get('checkout_items');
            $checkoutTotal = 0;
            foreach ($checkoutItems as $key => $checkoutItem) {
                $checkoutTotal += $checkoutItem->productProperties->where('property.property', 'Price')->first('value')->value * $checkoutItem->quantity;
            }
            $charge = $stripe->charges->create([
                'currency' => 'USD',
                'amount' => $checkoutTotal * 100,
                'source' => $token->id,
                'description' => 'Checkout',
            ]);
            if($charge->status == 'succeeded') {
                if (auth()->check()) {
                    $account = auth()->user()->account;
                    $shippingInformation = AccountShipping::where('account_id', auth()->user()->account->id)->where('is_selected', 1)->first();
                    $billingInformation = AccountBilling::where('account_id', auth()->user()->account->id)->first();
                } else {
                    $shippingInformation = Session::get('delivery_address_for_guest');
                    $billingInformation = Session::get('billing_address_for_guest');
                    $user = new User();
                    $user->name = $billingInformation['first_name'] . ' ' . $billingInformation['last_name'];
                    $user->email = $billingInformation['email'];
                    $user->type = 'Account';
                    $user->status = 'Inactive';
                    $user->save();

                    $latestGuestAccount = Account::where('type', 'Guest')->latest()->first();
                    if ($latestGuestAccount) {
                        $number = explode('-', $latestGuestAccount->number)[2] + 1;
                    } else {
                        $number = 100000;
                    }
                    $account = new Account();
                    $account->user_id = $user->id;
                    $account->number = 'G-' . date('Ymd') . '-' . $number;
                    $account->type = 'Guest';
                    $account->status = 'Pending';
                    $account->save();

                    $guestAccount = new GuestAccount();
                    $guestAccount->account_id = $account->id;
                    $guestAccount->first_name = $billingInformation['first_name'];
                    $guestAccount->last_name = $billingInformation['last_name'];
                    $guestAccount->email = $billingInformation['email'];
                    $guestAccount->phone = $billingInformation['phone'];
                    $guestAccount->save();


                }
                $currentDateOrderCount = count(Order::whereBetween('created_at', [date('Y-m-d') . ' 00:00:00', date('Y-m-d') . ' 23:59:59'])->get()) + 1;

                $order = new Order();
                $order->number = $currentDateOrderCount . '-' . time() . '-' . date('s') . date('i') . date('H') . date('d') . date('m') . date('Y');
                $order->account_id = $account->id;
                $order->transaction_object = json_encode($charge);
                $order->transact_through = 'Stripe';
                $order->status = 'Processing';
                $order->save();

                $orderShipping = new OrderShipping();
                $orderShipping->order_id = $order->id;
                $orderShipping->first_name = $shippingInformation['first_name'];
                $orderShipping->last_name = $shippingInformation['last_name'];
                $orderShipping->email = $shippingInformation['email'];
                $orderShipping->phone = $shippingInformation['phone'];
                $orderShipping->address_line_1 = $shippingInformation['address_line_1'];
                $orderShipping->address_line_2 = $shippingInformation['address_line_2'];
                $orderShipping->country_id = $shippingInformation['country_id'];
                $orderShipping->city = $shippingInformation['city'];
                $orderShipping->state = $shippingInformation['state'];
                $orderShipping->postal_code = $shippingInformation['postal_code'];
                $orderShipping->save();

                $orderBilling = new OrderBilling();
                $orderBilling->order_id = $order->id;
                $orderBilling->first_name = $billingInformation['first_name'];
                $orderBilling->last_name = $billingInformation['last_name'];
                $orderBilling->email = $billingInformation['email'];
                $orderBilling->phone = $billingInformation['phone'];
                $orderBilling->address_line_1 = $billingInformation['address_line_1'];
                $orderBilling->address_line_2 = $billingInformation['address_line_2'];
                $orderBilling->country_id = $billingInformation['country_id'];
                $orderBilling->city = $billingInformation['city'];
                $orderBilling->region = $billingInformation['state'];
                $orderBilling->postal_code = $billingInformation['postal_code'];
                $orderBilling->save();


                foreach ($checkoutItems as $key => $checkoutItem) {

                    $orderTransaction = new OrderTransaction();
                    $orderTransaction->order_id = $order->id;
                    $orderTransaction->product_id = $checkoutItem->id;
                    $orderTransaction->quantity = $checkoutItem->quantity;
                    $orderTransaction->price_per_unit = $checkoutItem->productProperties->where('property.property', 'Price')->first('value')->value;
                    $orderTransaction->payment_status = 'Released';
                    $orderTransaction->payout_status = 'Held';
                    $orderTransaction->delivery_status = 'Processing';
                    $orderTransaction->status = 'Processing';
                    $orderTransaction->save();

                    $userNotification = new UserNotification();
                    $userNotification->user_id = $checkoutItem->account->user_id;
                    $userNotification->type = 'Transaction';
                    $userNotification->title = 'An order for the product "' . $checkoutItem->productProperties->where('property.property', 'Title')->first('value')->value . '" has been made from the account number: "' . $account->number . '"';
                    $userNotification->order_transaction_id = $orderTransaction->id;
                    $userNotification->save();

                    $userNotification = new UserNotification();
                    $userNotification->user_id = 1;
                    $userNotification->type = 'Transaction';
                    $userNotification->title = 'An order for the product "' . $checkoutItem->productProperties->where('property.property', 'Title')->first('value')->value . '" owned by the account number: "' . $checkoutItem->account->number . '" has been made from the account number: "' . $account->number . '"';
                    $userNotification->order_transaction_id = $orderTransaction->id;
                    $userNotification->save();
                }
                Session::forget(['checkout_items', 'cart_items']);
                if ( ! auth()->check()) {
                    Session::forget(['delivery_address_for_guest', 'billing_address_for_guest', 'card_for_guest']);
                }
                Session::put('order_id', $order->id);
                return ['success' => true, 'message' => 'Order Placed Successfully', 'payload' => $order];
            } else {
                return ['success' => false, 'message' => 'Failed to Charge the Payment', 'payload' => null];
            }

        } catch(CardException $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        } catch (RateLimitException $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        } catch (InvalidRequestException $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        } catch (AuthenticationException $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        } catch (ApiConnectionException $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        } catch (ApiErrorException $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        } catch (Exception $e) {
            return ['success' => false, 'message' => $e->getMessage(), 'payload' => null];
        }
    }

    public function success()
    {
        $title = 'Order Confirmation';
        $activeNav = 'Order Confirmation';
        $order = Order::where('id', Session::get('order_id'))->with(['account', 'orderShipping', 'orderTransactions.product.account', 'orderTransactions.product.productProperties'])->first();
        return view('Frontend.checkout_success', compact('title', 'activeNav', 'order'));
    }



    public function initiatePaypal()
    {
        $payer = new Payer();
        $payer->setPaymentMethod("paypal");
        $checkoutItems =  Session::get('checkout_items');

        $checkoutTotal = 0;
        foreach ($checkoutItems as $key => $checkoutItem) {

            $propertyValues = json_decode($checkoutItem->property_values);
            $checkoutTotal += $propertyValues->{"Price Per Unit"} * $checkoutItem->quantity;
            $items[$key] = new Item();
            $items[$key]->setName($propertyValues->Title)
                ->setCurrency('USD')
                ->setQuantity($checkoutItem->quantity)
                ->setSku($propertyValues->{"Custom Label (SKU)"})
                ->setPrice($propertyValues->{"Price Per Unit"});
        }

        $itemList = new ItemList();
        $itemList->setItems($items);

        $shipTo = Session::get('ship_to');
        $shippingAddress = [
            "recipient_name" => $shipTo['first_name'] . ' ' . $shipTo['last_name'],
            "line1" => $shipTo['address_line_1'],
            "line2" => $shipTo['address_line_2'] === null ? '---' : $shipTo['address_line_2'],
            "city" => $shipTo['city'],
            "country_code" => "US",
            "postal_code" => $shipTo['zip_code'],
            "state" => $shipTo['region'],
            "phone" => $shipTo['phone']
        ];

        $itemList->setShippingAddress($shippingAddress);

        $details = new Details();
        $details->setShipping(0)
            ->setTax(0)
            ->setSubtotal($checkoutTotal);

        $amount = new Amount();
        $amount->setCurrency("USD")
            ->setTotal($checkoutTotal)
            ->setDetails($details);

        $transaction = new Transaction();
        $transaction->setAmount($amount)
            ->setItemList($itemList)
            ->setDescription("PayPal Checkout")
            ->setInvoiceNumber(uniqid());

        $baseUrl = url('/');
        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl("$baseUrl/checkout/paypal/payment/status")
            ->setCancelUrl("$baseUrl/checkout/paypal/payment/cancel");

        $payment = new Payment();
        $payment->setIntent("sale")
            ->setPayer($payer)
            ->setRedirectUrls($redirectUrls)
            ->setTransactions(array($transaction));

        try {
            $payment->create($this->apiContext);
        } catch (\PayPal\Exception\PayPalConnectionException $ex) {

            if (\Config::get('app.debug')) {
                Session::put('checkout_error', 'Connection Timeout');
                return Redirect::to('checkout');
            } else {
                Session::put('checkout_error', 'Some Error Occurred. Sorry for Inconvenience.');
                return Redirect::to('checkout');
            }
        }

        foreach ($payment->getLinks() as $link) {
            if ($link->getRel() == 'approval_url') {
                $redirectUrl = $link->getHref();
                break;
            }
        }

        if (isset($redirectUrl)) {
            return Redirect::away($redirectUrl);
        }

        Session::put('checkout_error', 'Unknown Error Occurred');
        return Redirect::to('checkout');



    }

    public function paypalPaymentStatus(Request $request)
    {
        $requestQuery = $request->query();
        $paymentId = $requestQuery['paymentId'];

        if (empty($requestQuery['PayerID']) || empty($requestQuery['token'])) {
            Session::put('checkout_error', 'Payment Failed');
            return Redirect::to('checkout');
        }

        $payment = Payment::get($paymentId, $this->apiContext);
        $execution = new PaymentExecution();
        $execution->setPayerId($requestQuery['PayerID']);

        $result = $payment->execute($execution, $this->apiContext);

        if ($result->getState() == 'approved') {

            $shipTo = Session::get('ship_to');
            $guest = new GuestAccount();
            $guest->country = $shipTo['country'];
            $guest->first_name = $shipTo['first_name'];
            $guest->last_name = $shipTo['last_name'];
            $guest->address_line_1 = $shipTo['address_line_1'];
            $guest->address_line_2 = $shipTo['address_line_2'] === null ? '---' : $shipTo['address_line_2'];
            $guest->city = $shipTo['city'];
            $guest->region = $shipTo['region'];
            $guest->zip_code = $shipTo['zip_code'];
            $guest->email = $shipTo['email'];
            $guest->phone = $shipTo['phone'];
            $guest->save();

            $order = new Order();
            $order->number = time();
            $order->buyer_id = $guest->id;
            $order->is_guest = true;
            $order->transaction_object = $result;
            $order->transact_through = 'PayPal';
            $order->status = 'Processing';
            $order->save();

            $checkoutItems = Session::get('checkout_items');
            foreach ($checkoutItems as $key => $checkoutItem) {
                $propertyValues = json_decode($checkoutItem->property_values);
                $transaction = new \App\Models\Transaction();
                $transaction->order_id = $order->id;
                $transaction->product_id = $checkoutItem->id;
                $transaction->quantity = $checkoutItem->quantity;
                $transaction->price_per_unit = $propertyValues->{"Price Per Unit"};
                $transaction->payment_status = 'Released';
                $transaction->payout_status = 'Held';
                $transaction->delivery_status = 'Processing';
                $transaction->status = 'Processing';
                $transaction->save();
            }
            Session::forget(['checkout_items', 'cart_items', 'ship_to', 'card_information', 'checkout_error']);
            return Redirect::to('checkout/success/' . $order->id);
        }

        Session::put('checkout_error', 'Payment Failed');
        return Redirect::to('checkout');
    }




    public function paypalPaymentCancel()
    {
        return Redirect::to('checkout');
    }





}
