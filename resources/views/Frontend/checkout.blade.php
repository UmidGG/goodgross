@extends('Layouts.frontend')
@section('content')
    <style type="text/css">
        .page_identity_line {
            color: #333333;
        }
        .page_identity_line a {
            color: #999999;
        }

        .mod_button_1 {
            border: none;
            background-color: skyblue;
            border-radius: 5px;
            color: #00115D;
            font-family: monospace;
        }

        .mod_button_2 {
            border: none;
            background-color: #ff0000fc;
            border-radius: 5px;
            color: azure;
            font-family: monospace;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12 mx-auto">


                <div class="row mt-4">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12 border-bottom pb-2" style="border-color: #e8f3ed !important;">
                        <div class="page_identity_line">
                            <a href="{{ url('/') }}">Home</a> . Checkout <sub>@if ($checkoutItems) {{ count($checkoutItems) }} @else 0 @endif Item(s)</sub>
                        </div>
                    </div>
                </div>


                <div class="row mt-4">

                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6 col-xxl-4">
                        <div class="text-secondary fw-bold p-2 mb-4" style="background-color: #efefef;">Order Review</div>
                        <div id="checkout_items_container">

                        </div>
                    </div>


                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6 col-xxl-4">
                        <div class="text-secondary fw-bold p-2 mb-4" style="background-color: #efefef;">Shipping To</div>
                        <div class="card border-0 shadow-sm">
                            <div class="card-body small">
                                <div id="delivery_addresses_container"></div>
                                <div id="delivery_address_form_container">
                                    <form id="delivery_address_form">

                                        <div class="form-floating mb-4">
                                            <select class="form-select border-0 border-bottom" name="country_id" id="country_id" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                <option value="">Select Country</option>
                                                @foreach($countries as $country)
                                                    <option value="{{ $country->id }}">{{ $country->name }}</option>
                                                @endforeach
                                            </select>
                                            <label for="country_id">Country</label>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating mb-4 mb-sm-0">
                                                    <input type="text" class="form-control border-0 border-bottom" name="first_name" id="first_name" placeholder="First Name" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="first_name">First Name</label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="last_name" id="last_name" placeholder="Last Name" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="last_name">Last Name</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating mb-4 mb-sm-0">
                                                    <textarea class="form-control border-0 border-bottom" id="address_line_1" name="address_line_1" placeholder="Address Line 1" style="border-color: #b1b1b1 !important; border-radius: 0;"></textarea>
                                                    <label for="address_line_1">Address Line 1</label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating">
                                                    <textarea class="form-control border-0 border-bottom" id="address_line_2" name="address_line_2" placeholder="Address Line 2 (Optional)" style="border-color: #b1b1b1 !important; border-radius: 0;"></textarea>
                                                    <label for="address_line_2">Address Line 2 (Optional)</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-4">
                                                <div class="form-floating mb-4 mb-sm-0">
                                                    <input type="text" class="form-control border-0 border-bottom" name="city" id="city" placeholder="City" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="city">City</label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div id="state_field_holder">

                                                </div>
                                            </div>

                                            <div class="col-12 col-sm-4">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="postal_code" id="postal_code" placeholder="Postal Code" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="postal_code">Postal Code</label>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-6">
                                                <div id="phone_field_holder">

                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="email" id="email" placeholder="Email" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="email">Email</label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col d-grid">
                                                <button type="submit" class="mod_button_1" id="delivery_address_form_submit_button" style="border-radius: 0;">
                                                    <span id="delivery_address_form_submit_button_text">Save</span>
                                                    <span id="delivery_address_form_submit_button_processing" class="sr-only"><span class="spinner-grow spinner-grow-sm text-info" role="status" aria-hidden="true"></span> Processing...</span>
                                                </button>
                                            </div>
                                            <div class="col d-grid">
                                                <button type="button" class="mod_button_2" id="delivery_address_form_cancel_button" style="border-radius: 0;">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>


                        </div>



                        <div class="text-secondary fw-bold p-2 mt-4 mb-4" style="background-color: #efefef;">Billing To</div>


                        <div class="card border-0 shadow-sm">
                            <div class="card-body small">
                                <div id="billing_address_container"></div>
                                <div id="billing_address_form_container">
                                    <form id="billing_address_form">
                                        <div class="form-floating mb-4">
                                            <select class="form-select border-0 border-bottom" name="country_id" id="country_id_for_billing" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                <option value="">Select Country</option>
                                                @foreach($countries as $country)
                                                    <option value="{{ $country->id }}">{{ $country->name }}</option>
                                                @endforeach
                                            </select>
                                            <label for="country_id_for_billing">Country</label>
                                        </div>


                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating mb-4 mb-sm-0">
                                                    <input type="text" class="form-control border-0 border-bottom" name="first_name" id="first_name_for_billing" placeholder="First Name" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="first_name_for_billing">First Name</label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="last_name" id="last_name_for_billing" placeholder="Last Name" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="last_name_for_billing">Last Name</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating mb-4 mb-sm-0">
                                                    <textarea class="form-control border-0 border-bottom" id="address_line_1_for_billing" name="address_line_1" placeholder="Address Line 1" style="border-color: #b1b1b1 !important; border-radius: 0;"></textarea>
                                                    <label for="address_line_1_for_billing">Address Line 1</label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating">
                                                    <textarea class="form-control border-0 border-bottom" id="address_line_2_for_billing" name="address_line_2" placeholder="Address Line 2 (Optional)" style="border-color: #b1b1b1 !important; border-radius: 0;"></textarea>
                                                    <label for="address_line_2_for_billing">Address Line 2 (Optional)</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-4">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="city" id="city_for_billing" placeholder="City" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="city_for_billing">City</label>
                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div id="state_field_holder_for_billing">

                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-4">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="postal_code" id="postal_code_for_billing" placeholder="Postal Code" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="postal_code_for_billing">Postal Code</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-12 col-sm-6">
                                                <div id="phone_field_holder_for_billing">

                                                </div>
                                            </div>
                                            <div class="col-12 col-sm-6">
                                                <div class="form-floating">
                                                    <input type="text" class="form-control border-0 border-bottom" name="email" id="email_for_billing" placeholder="Email" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <label for="email_for_billing">Email</label>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col d-grid">
                                                <button type="submit" class="mod_button_1" id="billing_address_form_submit_button" style="border-radius: 0;">
                                                    <span id="billing_address_form_submit_button_text">Save</span>
                                                    <span id="billing_address_form_submit_button_processing" class="sr-only"><span class="spinner-grow spinner-grow-sm text-info" role="status" aria-hidden="true"></span> Processing...</span>
                                                </button>
                                            </div>
                                            <div class="col d-grid">
                                                <button type="button" class="mod_button_2" id="billing_address_form_cancel_button" style="border-radius: 0;">Cancel</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="text-secondary fw-bold p-2 mt-4" style="background-color: #efefef;">Shipping Method</div>

                    </div>



                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-6 col-xxl-4">

                        <div class="text-secondary fw-bold p-2 mb-4" style="background-color: #efefef;">Payment</div>

                        <div class="border mb-3 py-3 px-3">
                            <div class="row">
                                <div class="col">
                                    <div class="form-check mb-2">
                                        <input type="radio" class="form-check-input payment_option" id="payment_option_paypal" name="payment_option" value="PayPal">
                                        <label class="form-check-label font-italic" for="payment_option_paypal" style="font-weight: 600;">
                                            PayPal
                                        </label>
                                    </div>
                                    <div style="color: #91a1a5; font-size: small; padding-left: 25px;">You will be redirected to PayPal website to complete your purchase securely.</div>
                                </div>
                                <div class="col">
                                    <img src="{{ asset('storage/img/application/paypal_cut.png') }}" class="img-fluid" alt="PayPal">
                                </div>
                            </div>
                        </div>
                        <div class="border py-3 px-3">
                            <div class="row">
                                <div class="col">
                                    <div class="form-check mb-2">
                                        <input type="radio" class="form-check-input payment_option" id="payment_option_card" name="payment_option" value="Card">
                                        <label class="form-check-label font-italic" for="payment_option_card" style="font-weight: 600;">
                                            Debit or Credit Card
                                        </label>
                                    </div>
                                    <div style="color: #91a1a5; font-size: small; padding-left: 25px;">Safe money transfer using Visa, Maestro, Discover, American Express.</div>
                                </div>
                                <div class="col">
                                    <img src="{{ asset('storage/img/application/cards.png') }}" class="img-fluid" alt="PayPal">
                                </div>
                            </div>



                            <div class="mt-4" id="cards_container"></div>

                            <div class="mt-4" id="card_form_container">

                                <form id="card_form">

                                    <div class="row mb-4">
                                        <div class="col-3 pe-0">
                                            <div class="input-group-text border-0 border-bottom text-wrap small" style="color: #615f75; border-radius: 0; height: 100%; border-color: #b1b1b1 !important;">Name on Card</div>
                                        </div>
                                        <div class="col-9 ps-0">
                                            <div class="row">
                                                <div class="col pe-0">
                                                    <div class="form-floating">
                                                        <input class="form-control border-0 border-bottom" name="first_name" id="first_name_for_card" autocomplete="off" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;" placeholder="First Name">
                                                        <label for="first_name_for_card">First Name</label>
                                                    </div>
                                                </div>
                                                <div class="col ps-0">
                                                    <div class="form-floating">
                                                        <input class="form-control border-0 border-bottom" name="last_name" id="last_name_for_card" autocomplete="off" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;" placeholder="Last Name">
                                                        <label for="last_name_for_card">Last Name</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row mb-4">
                                        <div class="col-8">
                                            <div class="form-floating">
                                                <input autocomplete="off" class="form-control border-0 border-bottom" type="text" name="card_number" id="card_number" placeholder="Card Number" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                <label for="card_number">Card Number</label>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="form-floating">
                                                <input type="text" autocomplete="off" class="form-control border-0 border-bottom" size="4" name="security_code" id="security_code" placeholder="Security Code" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                <label for="security_code">Security Code</label>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row mb-4">
                                        <div class="col-3 pe-0">
                                            <div class="input-group-text small border-0 border-bottom text-wrap" style="color: #615f75; border-radius: 0; height: 100%; border-color: #b1b1b1 !important;">Expiry Date</div>
                                        </div>
                                        <div class="col-9 ps-0">
                                            <div class="row">
                                                <div class="col pe-0">
                                                    <div class="form-floating">
                                                        <select class="form-select border-0 border-bottom" name="expiry_month" id="expiry_month" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                            <option value="">Select Month</option>
                                                            <option value="January">January</option>
                                                            <option value="February">February</option>
                                                            <option value="March">March</option>
                                                            <option value="April">April</option>
                                                            <option value="May">May</option>
                                                            <option value="June">June</option>
                                                            <option value="July">July</option>
                                                            <option value="August">August</option>
                                                            <option value="September">September</option>
                                                            <option value="October">October</option>
                                                            <option value="November">November</option>
                                                            <option value="December">December</option>
                                                        </select>
                                                        <label for="expiry_month">Month</label>
                                                    </div>
                                                </div>
                                                <div class="col ps-0">
                                                    <div class="form-floating">
                                                        <select class="form-select border-0 border-bottom" name="expiry_year" id="expiry_year" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                            <option value="">Select Year</option>
                                                            @for($i = date('Y'); $i <= date('Y') + 10; $i++)
                                                                <option value="{{ $i }}">{{ $i }}</option>
                                                            @endfor
                                                        </select>
                                                        <label for="expiry_year">Year</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col d-grid">
                                            <button type="submit" class="mod_button_1" id="card_form_submit_button" style="border-radius: 0;">
                                                <span id="card_form_submit_button_text">Done</span>
                                                <span id="card_form_submit_button_processing" class="sr-only"><span class="spinner-grow spinner-grow-sm text-info" role="status" aria-hidden="true"></span> Processing...</span>
                                            </button>
                                        </div>
                                        <div class="col d-grid">
                                            <button type="button" class="mod_button_2" id="card_form_cancel_button" style="border-radius: 0;">Cancel</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>


                        <div class="text-secondary fw-bold p-2 my-4" style="background-color: #efefef;">Order Summary</div>
                        <div id="order_summary_container">

                        </div>
                    </div>
                </div>


            </div>
        </div>


    </div>
    <div class="mt-3"></div>
    <script type="text/javascript">


        $(document).ready(function () {

            let isGuest = '{{ $isGuest }}';
            loadCheckoutItems();

            if (isGuest) {
                loadDeliveryAddressForGuest();
                loadBillingAddressForGuest();
            } else {
                loadDeliveryAddressesForAccount();
                loadBillingAddressForAccount();
            }

            $('#delivery_address_form_container').hide();
            $('#billing_address_form_container').hide();
            $('#cards_container').hide();
            $('#card_form_container').hide();
        });


        function loadCheckoutItems() {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/items') }}',

                success: function (result) {
                    console.log(result);
                    $('#checkout_items_container').empty();
                    $('#order_summary_container').empty();

                    if (result.payload !== null && Object.keys(result.payload).length > 0) {

                        let subtotal = 0;
                        $.each(result.payload, function (key, checkoutItem) {

                            let title = checkoutItem.product_properties.find(obj => obj.property.property === 'Title');
                            let images = checkoutItem.product_properties.find(obj => obj.property.property === 'Images');
                            let price = checkoutItem.product_properties.find(obj => obj.property.property === 'Price');
                            let quantity = checkoutItem.product_properties.find(obj => obj.property.property === 'Quantity');
                            let shippingTime = checkoutItem.product_properties.find(obj => obj.property.property === 'Shipping Time');
                            let daysIncreased = shippingTime.value === 'Same Business Day' ? 0 : shippingTime.value === '1 Business Days - 10 Business Days' ? 10 : shippingTime.value === '15 Business Days' ? 15 : shippingTime.value === '20 Business Days' ? 20 : 30;
                            let accountInfo = checkoutItem.account.type === 'Personal' ? (checkoutItem.account.personal_account.first_name + ' ' + checkoutItem.account.personal_account.last_name) : checkoutItem.account.business_account.name;

                            let imgSrc = '{{ asset('storage') }}/' + images.value.split(',')[0];


                            subtotal += parseFloat(price.value) * parseFloat(checkoutItem.quantity);



                            $('#checkout_items_container').append(`

                                <div class="card shadow-sm border-0 mb-4">
                                    <div class="card-header border-0 py-3" style="background-color: #56dbff21;">
                                        <div class="row">
                                            <div class="col">
                                                <div class="small">Seller: <span class="primary_text_color_default fw-bold">` + accountInfo + `</span></div>
                                            </div>
                                            <div class="col">
                                                <div class="text-end"><a href="#" class="text-decoration-none text-primary small">Message to Seller</a></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row g-0 p-3">
                                        <div class="col-12 col-sm-3 col-md-4 col-lg-4 col-xl-4 col-xxl-3">
                                            <img src="` + imgSrc + `" class="img-fluid rounded" alt="` + title.value + `">
                                        </div>
                                        <div class="col-12 col-sm-9 col-md-8 col-lg-8 col-xl-8 col-xxl-9">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-12 col-sm-8">
                                                        <div class="card-title fw-bold"><div class="mb-2 primary_text_color_default  font-weight-bold" style="font-size: 120%;">` + title.value + `</div></div>
                                                    </div>
                                                    <div class="col-12 col-sm-4 pe-0">
                                                        <div class="text-end text-warning">US $` + (parseFloat(price.value) * parseFloat(checkoutItem.quantity)).toFixed(2) + `</div>
                                                    </div>
                                                </div>

                                                <div class="mt-2">
                                                    <span class="fw-bold small">Price per Unit:</span>
                                                    <span class="small">US $` + parseFloat(price.value).toFixed(2) + `</span>
                                                </div>
                                                <div class="mt-1">
                                                    <span class="fw-bold small">In Stock:</span>
                                                    <span class="small">` + quantity.value + ` Unit</span>
                                                </div>
                                                <div  class="mt-1">
                                                    <span class="fw-bold small">Est. Delivery:</span>
                                                    <span class="small">` + $.datepicker.formatDate('MM d, yy', new Date(new Date().setDate(new Date().getDate() + daysIncreased))) + `</span>
                                                </div>
                                                <div class="mt-3">
                                                    <button type="button" style="padding: 8px 15px; border: none; background-color: #cccccc; font-size: small; cursor: pointer;" class="quantity_minus" data-item_id="` + checkoutItem.id + `">-</button>
                                                    <span style="padding: 10px 30px; background-color: #fff5f2; font-size: small;"><span class="quantity">` + checkoutItem.quantity + `</span></span>
                                                    <button type="button" style="padding: 8px 15px; border: none; background-color: #cccccc; font-size: small; cursor: pointer;" class="quantity_plus" data-item_id="` + checkoutItem.id + `">+</button>
                                                </div>
                                                <div class="mt-4">
                                                    <a class="text-primary text-decoration-none small delete_item" data-item_id="` + checkoutItem.id + `" href="javascript:void(0)">Delete</a> | <a href="#" class="text-primary text-decoration-none small">Move to Wishlist</a>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            `);

                        });




                        $('#order_summary_container').append(`
                            <div class="card border-0 shadow-sm">
                                <div class="card-body">


                                    <div class="">Subtotal: <b>US $` + subtotal.toFixed(2) + `</b></div>
                                    <div class="mt-1">Shipping: <b>Free</b></div>
                                    <div class="mt-1">Estimated Tax: <b>US $0.00</b></div>
                                    <hr style="color: #a5d4ba;">
                                    <div class="mb-3">Grand Total : <b>US $` + subtotal.toFixed(2) + `</b></div>
                                    <hr style="color: #a5d4ba;">
                                    <div class="text-danger text-center small" id="payment_option_message">Select a Payment Option</div>
                                    <div class="my-4 d-grid gap-3">
                                        <button class="btn primary_btn_default" id="place_order_button" style="border-radius: 0;" disabled>
                                            <span id="place_order_button_text">Confirm to Place Order</span>
                                            <span id="place_order_button_processing" class="sr-only"><span class="spinner-grow spinner-grow-sm text-info" role="status" aria-hidden="true"></span> Processing...</span>
                                        </button>
                                        <button class="btn btn-outline-info" style="border-radius: 0;">Continue Shopping</button>
                                    </div>
                                </div>
                            </div>

                        `);

                    } else {
                        $('#checkout_items_container').append(`
                            <div class="alert alert-info">
                                No Item Found!
                            </div>
                        `);
                    }
                },
                error: function (xhr) {
                    console.log(xhr)
                }
            });
        }





        //////////////////////////////////////////////////////Shipping Section Start//////////////////////////////////////////////////////////

        $(document).on('change', '#country_id', function () {
            let countryId = $(this).val();
            $.ajax({
                method: 'get',
                url: '{{ url('get/states/by/country/id') }}',
                data: {
                    country_id: countryId
                },
                cache: false,
                success: function (states) {
                    console.log(states);
                    $('#state_field_holder').empty();
                    if (states.length > 0) {
                        $('#state_field_holder').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state">State</label></div>');
                        $.each(states, function (key, state) {
                            $('#state').append('<option value="' + state.state + '">' + state.state + '</option>');
                        });
                    } else {
                        $('#state_field_holder').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state" placeholder="State" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state">State</label></div>');
                    }

                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/country/by/id') }}',
                        data: {
                            id: countryId
                        },
                        cache: false,
                        success: function (result) {
                            console.log(result);
                            $('#phone_field_holder').empty();
                            if (result.payload !== null) {
                                $('#phone_field_holder').append(`
                                    <div class="row">
                                        <div class="col-4 pe-0" style="padding-top: 18px;">
                                            <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                                <img src="` + result.payload.flag + `" style="height: 20px;">
                                                <span class="">` + result.payload.dialling_code + `</span>
                                            </div>
                                        </div>
                                        <div class="col-8 ps-0">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone" placeholder="Phone" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                <label for="phone">Phone</label>
                                            </div>
                                        </div>
                                    </div>
                                `);
                            } else {
                                $('#phone_field_holder').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="phone" id="phone" placeholder="Phone" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="phone">Phone</label></div>');
                            }
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });


                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });

        function clearDeliveryAddressForm() {
            $('#delivery_address_form').find('#id').remove();
            $('#country_id option').removeAttr('selected');
            $('#state_field_holder').empty();
            $('#phone_field_holder').empty();
            $('#delivery_address_form').find('.invalid-feedback').remove();
            $('#delivery_address_form').find('.is-invalid').removeClass('is-invalid');
            $('#delivery_address_form')[0].reset();
        }

        function loadDeliveryAddressesForAccount() {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/account/delivery/addresses') }}',
                success: function (result) {
                    console.log(result);
                    if (result.payload !== null && Object.keys(result.payload).length > 0) {
                        let bottomLinks;
                        let addressLine2;
                        $('#delivery_addresses_container').empty();
                        if (result.payload.length > 1) {
                            let selectedText;
                            let selectedColor;
                            let selectForCheckoutButton;
                            $.each(result.payload, function (key, accountShipping) {
                                bottomLinks = parseInt(accountShipping.is_selected) === 0 ? '<a href="javascript:void(0)" class="edit_delivery_address_for_account" data-id="' + accountShipping.id + '">Edit</a> | <a href="javascript:void(0)" class="delete_delivery_address_for_account" data-id="' + accountShipping.id + '">Delete</a>' : '<a href="javascript:void(0)" class="edit_delivery_address_for_account" data-id="' + accountShipping.id + '">Edit</a>';
                                selectedText = parseInt(accountShipping.is_selected) === 1 ? '<div style="position: absolute; left: 0; top: 0; background: #626f68; color: #fff; padding: 5px 50px;">Selected</div>' : '';
                                selectedColor = parseInt(accountShipping.is_selected) === 1 ? 'ghostwhite' : 'white';
                                addressLine2 = accountShipping.address_line_2 !== null ? ', ' + accountShipping.address_line_2 : '';
                                selectForCheckoutButton = parseInt(accountShipping.is_selected) === 0 ? '<button class="btn btn-outline-secondary select_delivery_address_for_account" style="position: absolute; left: 0; top: 0; border-radius: 0; padding: 5px 15px; font-size: 14px; border-color: #c9cfd5 !important;" data-id="' + accountShipping.id + '">Select for Checkout</button>' : '';
                                $('#delivery_addresses_container').append(`
                                <div class="card mb-3" style="background-color: ` + selectedColor + `; border-radius: 0;">
                                    <div class="card-body">
                                        ` + selectedText + selectForCheckoutButton + `
                                        <div class="mt-4">` + accountShipping.first_name + ' ' + accountShipping.last_name + `</div>
                                        <div>` + accountShipping.address_line_1 + addressLine2 + `</div>
                                        <div>` + accountShipping.city + ' ' + accountShipping.postal_code + `</div>
                                        <div>` + accountShipping.state + `</div>
                                        <div>` + accountShipping.country.name + `</div>
                                        <div><img src="` + accountShipping.country.flag + `" style="height: 20px;"> <span>` + accountShipping.country.dialling_code + `</span> ` + accountShipping.phone + `</div>
                                        <div class="mt-1">` + bottomLinks + `</div>
                                    </div>
                                </div>
                            `);
                            });
                            $('#delivery_addresses_container').append(`
                                <div class="row mt-3"><div class="col d-grid"><button type="button" class="mod_button_1" id="add_delivery_address_for_account" style="border-radius: 0;">Add New Address</button></div></div>
                            `);
                        } else {
                            $.each(result.payload, function (key, accountShipping) {
                                bottomLinks = '<a href="javascript:void(0)" class="edit_delivery_address_for_account" data-id="' + accountShipping.id + '">Edit</a>';
                                addressLine2 = accountShipping.address_line_2 !== null ? ', ' + accountShipping.address_line_2 : '';
                                $('#delivery_addresses_container').append(`
                                <div style="background-color: white;">
                                    <div>` + accountShipping.first_name + ' ' + accountShipping.last_name + `</div>
                                    <div>` + accountShipping.address_line_1 + addressLine2 + `</div>
                                    <div>` + accountShipping.city + ' ' + accountShipping.postal_code + `</div>
                                    <div>` + accountShipping.state + `</div>
                                    <div>` + accountShipping.country.name + `</div>
                                    <div><img src="` + accountShipping.country.flag + `" style="height: 20px;"> <span>` + accountShipping.country.dialling_code + `</span> ` + accountShipping.phone + `</div>
                                    <div class="mt-1">` + bottomLinks + `</div>
                                </div>
                            `);
                            });
                            $('#delivery_addresses_container').append(`
                                <div class="row mt-3"><div class="col d-grid"><button type="button" class="mod_button_1" id="add_delivery_address_for_account" style="border-radius: 0;">Add New Address</button></div></div>
                            `);
                        }
                    } else {

                    }
                },
                error: function (xhr) {
                    console.log(xhr)
                }
            });
        }

        $(document).on('click', '.select_delivery_address_for_account', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/select/account/delivery/address') }}',
                data: {
                    id: $(this).data('id')
                },
                cache: false,
                success: function (result) {
                    console.log(result);
                    loadDeliveryAddressesForAccount();
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });

        $(document).on('click', '.delete_delivery_address_for_account', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/delete/account/delivery/address') }}',
                data: {
                    id: $(this).data('id')
                },
                cache: false,
                success: function (result) {
                    console.log(result);
                    loadDeliveryAddressesForAccount();
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });

        $(document).on('click', '#add_delivery_address_for_account', function () {
            $('#delivery_addresses_container').empty();
            clearDeliveryAddressForm();
            let userCountry = '{{ $userCountry }}';
            let userState = '{{ $userState }}';
            if (userCountry) {
                $('#country_id option:contains(' + userCountry + ')').attr('selected', true);
            }
            $.ajax({
                method: 'get',
                url: '{{ url('get/states/by/country/id') }}',
                data: {
                    country_id: $('#country_id').val()
                },
                cache: false,
                success: function (states) {
                    console.log(states);
                    $('#state_field_holder').empty();
                    if (states.length > 0) {
                        $('#state_field_holder').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state">State</label></div>');
                        $.each(states, function (key, state) {
                            if (userState === state.state) {
                                $('#state').append('<option value="' + state.state + '" selected>' + state.state + '</option>');
                            } else {
                                $('#state').append('<option value="' + state.state + '">' + state.state + '</option>');
                            }
                        });
                    } else {
                        $('#state_field_holder').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state" placeholder="State" value="' + userState + '" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state">State</label></div>');
                    }
                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/country/by/id') }}',
                        data: {
                            id: $('#country_id').val()
                        },
                        cache: false,
                        success: function (result) {
                            console.log(result);
                            $('#phone_field_holder').empty();
                            if (result.payload !== null) {
                                $('#phone_field_holder').append(`
                                    <div class="row">
                                        <div class="col-4 pe-0" style="padding-top: 18px;">
                                            <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                                <img src="` + result.payload.flag + `" style="height: 20px;">
                                                <span class="">` + result.payload.dialling_code + `</span>
                                            </div>
                                        </div>
                                        <div class="col-8 ps-0">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone" placeholder="Phone" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                <label for="phone">Phone</label>
                                            </div>
                                        </div>
                                    </div>
                                `);
                            } else {
                                $('#phone_field_holder').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="phone" id="phone" placeholder="Phone" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="phone">Phone</label></div>');
                            }
                            $('#delivery_address_form_submit_button_text').text('Save');
                            $('#delivery_address_form_container').show(1000);
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });

        });

        $(document).on('click', '.edit_delivery_address_for_account', function () {

            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/account/delivery/address/by/id') }}',
                data: {
                    id: $(this).data('id')
                },
                success: function (result) {
                    console.log(result);
                    clearDeliveryAddressForm();
                    $('#delivery_addresses_container').empty();
                    $('#delivery_address_form').append('<input type="hidden" name="id" id="id" value="' + result.payload.id + '">');
                    $('#first_name').val(result.payload.first_name);
                    $('#last_name').val(result.payload.last_name);
                    $('#country_id').val(result.payload.country_id);
                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/states/by/country/id') }}',
                        data: {
                            country_id: $('#country_id').val()
                        },
                        cache: false,
                        success: function (states) {
                            console.log(states);
                            $('#state_field_holder').empty();
                            if (states.length > 0) {
                                $('#state_field_holder').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state">State</label></div>');
                                $.each(states, function (key, state) {
                                    if (result.payload.state === state.state) {
                                        $('#state').append('<option value="' + state.state + '" selected>' + state.state + '</option>');
                                    } else {
                                        $('#state').append('<option value="' + state.state + '">' + state.state + '</option>');
                                    }
                                });
                            } else {
                                $('#state_field_holder').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state" placeholder="State" value="' + result.payload.state + '" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state">State</label></div>');
                            }
                            $('#city').val(result.payload.city);
                            $('#postal_code').val(result.payload.postal_code);
                            $('#address_line_1').val(result.payload.address_line_1);
                            $('#address_line_2').val(result.payload.address_line_2);
                            $('#phone_field_holder').append(`
                                <div class="row">
                                    <div class="col-4 pe-0" style="padding-top: 18px;">
                                        <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                            <img src="` + result.payload.country.flag + `" style="height: 20px;">
                                            <span class="">` + result.payload.country.dialling_code + `</span>
                                        </div>
                                    </div>
                                    <div class="col-8 ps-0">
                                        <div class="form-floating">
                                            <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone" placeholder="Phone" value="` + result.payload.phone + `" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                            <label for="phone">Phone</label>
                                        </div>
                                    </div>
                                </div>
                            `);
                            $('#email').val(result.payload.email);
                            $('#delivery_address_form_submit_button_text').text('Update');
                            $('#delivery_address_form_container').show(1000);
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });


        function loadDeliveryAddressForGuest() {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/guest/delivery/address') }}',
                success: function (result) {
                    console.log(result);
                    if (result.payload !== null && Object.keys(result.payload).length > 0) {
                        let addressLine2 = result.payload.address_line_2 !== null ? ', ' + result.payload.address_line_2 : '';
                        $('#delivery_addresses_container').empty();
                        $('#delivery_addresses_container').append(`
                            <div>` + result.payload.first_name + ' ' + result.payload.last_name + `</div>
                            <div>` + result.payload.address_line_1 + addressLine2 + `</div>
                            <div>` + result.payload.city + ' ' + result.payload.postal_code + `</div>
                            <div>` + result.payload.state + `</div>
                            <div>` + result.payload.country.name + `</div>
                            <div><img src="` + result.payload.country.flag + `" style="height: 20px;"> <span>` + result.payload.country.dialling_code + `</span> ` + result.payload.phone + `</div>
                            <div class="mt-3"><a href="javascript:void(0)" id="edit_delivery_address_for_guest">Edit</a></div>
                        `);
                    } else {

                    }

                },
                error: function (xhr) {
                    console.log(xhr)
                }
            });
        }

        $(document).on('click', '#edit_delivery_address_for_guest', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/guest/delivery/address') }}',
                data: {
                    id: $(this).data('id')
                },
                success: function (result) {
                    console.log(result);
                    clearDeliveryAddressForm();
                    $('#delivery_addresses_container').empty();
                    $('#first_name').val(result.payload.first_name);
                    $('#last_name').val(result.payload.last_name);
                    $('#country_id').val(result.payload.country_id);
                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/states/by/country/id') }}',
                        data: {
                            country_id: $('#country_id').val()
                        },
                        cache: false,
                        success: function (states) {
                            console.log(states);
                            $('#state_field_holder').empty();
                            if (states.length > 0) {
                                $('#state_field_holder').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state">State</label></div>');
                                $.each(states, function (key, state) {
                                    if (result.payload.state === state.state) {
                                        $('#state').append('<option value="' + state.state + '" selected>' + state.state + '</option>');
                                    } else {
                                        $('#state').append('<option value="' + state.state + '">' + state.state + '</option>');
                                    }
                                });
                            } else {
                                $('#state_field_holder').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state" placeholder="State" value="' + result.payload.state + '" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state">State</label></div>');
                            }
                            $('#city').val(result.payload.city);
                            $('#postal_code').val(result.payload.postal_code);
                            $('#address_line_1').val(result.payload.address_line_1);
                            $('#address_line_2').val(result.payload.address_line_2);
                            $('#phone_field_holder').append(`
                                <div class="row">
                                    <div class="col-4 pe-0" style="padding-top: 18px;">
                                        <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                            <img src="` + result.payload.country.flag + `" style="height: 20px;">
                                            <span class="">` + result.payload.country.dialling_code + `</span>
                                        </div>
                                    </div>
                                    <div class="col-8 ps-0">
                                        <div class="form-floating">
                                            <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone" placeholder="Phone" value="` + result.payload.phone + `" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                            <label for="phone">Phone</label>
                                        </div>
                                    </div>
                                </div>
                            `);
                            $('#email').val(result.payload.email);
                            $('#delivery_address_form_submit_button_text').text('Update');
                            $('#delivery_address_form_container').show(1000);
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });


        });


        $(document).on('submit', '#delivery_address_form', function (event) {
            event.preventDefault();
            $('#delivery_address_form').find('.invalid-feedback').remove();
            $('#delivery_address_form').find('.is-invalid').removeClass('is-invalid');
            $('#delivery_address_form_submit_button').addClass('disabled');
            $('#delivery_address_form_submit_button_text').addClass('sr-only');
            $('#delivery_address_form_submit_button_processing').removeClass('sr-only');
            let formData = new FormData(this);
            formData.append('_token', '{{ csrf_token() }}');
            let isGuest = '{{ $isGuest }}';
            let url = isGuest ? '{{ url('checkout/save/guest/delivery/address') }}' : '{{ url('checkout/save/account/delivery/address') }}';
            $.ajax({
                method: 'post',
                url: url,
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                global: false,
                success: function (result) {
                    console.log(result);
                    $('#delivery_address_form_submit_button').removeClass('disabled');
                    $('#delivery_address_form_submit_button_text').removeClass('sr-only');
                    $('#delivery_address_form_submit_button_processing').addClass('sr-only');
                    clearDeliveryAddressForm();
                    $('#delivery_address_form_container').hide(1000);
                    if (isGuest) {
                        loadDeliveryAddressForGuest();
                    } else {
                        loadDeliveryAddressesForAccount();
                    }
                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#delivery_address_form_submit_button').removeClass('disabled');
                    $('#delivery_address_form_submit_button_text').removeClass('sr-only');
                    $('#delivery_address_form_submit_button_processing').addClass('sr-only');
                    if (xhr.responseJSON.hasOwnProperty('errors')) {
                        $.each(xhr.responseJSON.errors, function (key, value) {
                            $('#' + key).after('<div class="invalid-feedback"></div>');
                            $('#' + key).addClass('is-invalid');
                            $.each(value, function (k, v) {
                                $('#' + key).parent().find('.invalid-feedback').append('<div>' + v + '</div>');
                            });
                        })
                    }
                }
            });
        });

        $(document).on('click', '#delivery_address_form_cancel_button', function () {
            clearDeliveryAddressForm();
            $('#delivery_address_form_container').hide(1000);
            let isGuest = '{{ $isGuest }}';
            if (isGuest) {
                loadDeliveryAddressForGuest();
            } else {
                loadDeliveryAddressesForAccount();
            }
        });

        //////////////////////////////////////////////////////Shipping Section End//////////////////////////////////////////////////////////


        //////////////////////////////////////////////////////Billing Section Start//////////////////////////////////////////////////////////


        $(document).on('change', '#country_id_for_billing', function () {
            let countryId = $(this).val();
            $.ajax({
                method: 'get',
                url: '{{ url('get/states/by/country/id') }}',
                data: {
                    country_id: countryId
                },
                cache: false,
                success: function (result) {
                    console.log(result);
                    $('#state_field_holder_for_billing').empty();
                    if (result.length > 0) {
                        $('#state_field_holder_for_billing').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state_for_billing" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state_for_billing">State</label></div>');
                        $.each(result, function (key, state) {
                            $('#state_for_billing').append('<option value="' + state.state + '">' + state.state + '</option>');
                        });
                    } else {
                        $('#state_field_holder_for_billing').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state_for_billing" placeholder="State" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state_for_billing">State</label></div>');
                    }
                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/country/by/id') }}',
                        data: {
                            id: countryId
                        },
                        cache: false,
                        success: function (result) {
                            console.log(result);
                            $('#phone_field_holder_for_billing').empty();
                            if (result.payload !== null) {
                                $('#phone_field_holder_for_billing').append(`
                                    <div class="row">
                                        <div class="col-4 pe-0" style="padding-top: 18px;">
                                            <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                                <img src="` + result.payload.flag + `" style="height: 20px;">
                                                <span class="">` + result.payload.dialling_code + `</span>
                                            </div>
                                        </div>
                                        <div class="col-8 ps-0">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone_for_billing" placeholder="Phone" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                                <label for="phone_for_billing">Phone</label>
                                            </div>
                                        </div>
                                    </div>
                                `);
                            } else {
                                $('#phone_field_holder_for_billing').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="phone" id="phone_for_billing" placeholder="Phone" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="phone_for_billing">Phone</label></div>');
                            }
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });


        function clearBillingAddressForm() {
            $('#billing_address_form').find('#id_for_billing').remove();
            $('#country_id_for_billing option').removeAttr('selected');
            $('#state_field_holder_for_billing').empty();
            $('#phone_field_holder_for_billing').empty();
            $('#billing_address_form').find('.invalid-feedback').remove();
            $('#billing_address_form').find('.is-invalid').removeClass('is-invalid');
            $('#billing_address_form')[0].reset();
        }

        function loadBillingAddressForAccount() {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/account/billing/address') }}',
                success: function (result) {
                    console.log(result);
                    if (result.payload !== null && Object.keys(result.payload).length > 0) {
                        let addressLine2 = result.payload.address_line_2 !== null ? ', ' + result.payload.address_line_2 : '';
                        $('#billing_address_container').empty();
                        $('#billing_address_container').append(`
                            <div>` + result.payload.first_name + ' ' + result.payload.last_name + `</div>
                            <div>` + result.payload.address_line_1 + addressLine2 + `</div>
                            <div>` + result.payload.city + ' ' + result.payload.postal_code + `</div>
                            <div>` + result.payload.state + `</div>
                            <div>` + result.payload.country.name + `</div>
                            <div><img src="` + result.payload.country.flag + `" style="height: 20px;"> <span>` + result.payload.country.dialling_code + `</span> ` + result.payload.phone + `</div>
                            <div class="mt-3"><a href="javascript:void(0)" id="edit_billing_address_for_account" data-id="` + result.payload.id + `">Edit</a></div>
                        `);
                    } else {

                    }

                },
                error: function (xhr) {
                    console.log(xhr)
                }
            });
        }

        function loadBillingAddressForGuest() {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/guest/billing/address') }}',
                success: function (result) {
                    console.log(result);
                    if (result.payload !== null && Object.keys(result.payload).length > 0) {
                        let addressLine2 = result.payload.address_line_2 !== null ? ', ' + result.payload.address_line_2 : '';
                        $('#billing_address_container').empty();
                        $('#billing_address_container').append(`
                            <div>` + result.payload.first_name + ' ' + result.payload.last_name + `</div>
                            <div>` + result.payload.address_line_1 + addressLine2 + `</div>
                            <div>` + result.payload.city + ' ' + result.payload.postal_code + `</div>
                            <div>` + result.payload.state + `</div>
                            <div>` + result.payload.country.name + `</div>
                            <div><img src="` + result.payload.country.flag + `" style="height: 20px;"> <span>` + result.payload.country.dialling_code + `</span> ` + result.payload.phone + `</div>
                            <div class="mt-3"><a href="javascript:void(0)" id="edit_billing_address_for_guest">Edit</a></div>
                        `);
                    } else {

                    }

                },
                error: function (xhr) {
                    console.log(xhr)
                }
            });
        }


        $(document).on('click', '#edit_billing_address_for_account', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/account/billing/address/by/id') }}',
                data: {
                    id: $(this).data('id')
                },
                success: function (result) {
                    console.log(result);
                    clearBillingAddressForm();
                    $('#billing_address_container').empty();
                    $('#billing_address_form').append('<input type="hidden" name="id" id="id_for_billing" value="' + result.payload.id + '">');
                    $('#first_name_for_billing').val(result.payload.first_name);
                    $('#last_name_for_billing').val(result.payload.last_name);
                    $('#country_id_for_billing').val(result.payload.country_id);
                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/states/by/country/id') }}',
                        data: {
                            country_id: $('#country_id_for_billing').val()
                        },
                        cache: false,
                        success: function (states) {
                            console.log(states);
                            $('#state_field_holder_for_billing').empty();
                            if (states.length > 0) {
                                $('#state_field_holder_for_billing').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state_for_billing" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state_for_billing">State</label></div>');
                                $.each(states, function (key, state) {
                                    if (result.payload.state === state.state) {
                                        $('#state_for_billing').append('<option value="' + state.state + '" selected>' + state.state + '</option>');
                                    } else {
                                        $('#state_for_billing').append('<option value="' + state.state + '">' + state.state + '</option>');
                                    }
                                });
                            } else {
                                $('#state_field_holder_for_billing').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state_for_billing" placeholder="State" value="' + result.payload.state + '" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state_for_billing">State</label></div>');
                            }
                            $('#city_for_billing').val(result.payload.city);
                            $('#postal_code_for_billing').val(result.payload.postal_code);
                            $('#address_line_1_for_billing').val(result.payload.address_line_1);
                            $('#address_line_2_for_billing').val(result.payload.address_line_2);
                            $('#phone_field_holder_for_billing').append(`
                                <div class="row">
                                    <div class="col-4 pe-0" style="padding-top: 17px;">
                                        <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                            <img src="` + result.payload.country.flag + `" style="height: 20px;">
                                            <span class="">` + result.payload.country.dialling_code + `</span>
                                        </div>
                                    </div>
                                    <div class="col-8 ps-0">
                                        <div class="form-floating">
                                            <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone_for_billing" placeholder="Phone" value="` + result.payload.phone + `" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                            <label for="phone_for_billing">Phone</label>
                                        </div>
                                    </div>
                                </div>
                            `);
                            $('#email_for_billing').val(result.payload.email);
                            $('#billing_address_form_submit_button_text').text('Update');
                            $('#billing_address_form_container').show(1000);
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });


        });


        $(document).on('click', '#edit_billing_address_for_guest', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/guest/billing/address') }}',
                data: {
                    id: $(this).data('id')
                },
                success: function (result) {
                    console.log(result);
                    clearBillingAddressForm();
                    $('#billing_address_container').empty();
                    $('#first_name_for_billing').val(result.payload.first_name);
                    $('#last_name_for_billing').val(result.payload.last_name);
                    $('#country_id_for_billing').val(result.payload.country_id);
                    $.ajax({
                        method: 'get',
                        url: '{{ url('get/states/by/country/id') }}',
                        data: {
                            country_id: $('#country_id_for_billing').val()
                        },
                        cache: false,
                        success: function (states) {
                            console.log(states);
                            $('#state_field_holder_for_billing').empty();
                            if (states.length > 0) {
                                $('#state_field_holder_for_billing').append('<div class="form-floating"><select class="form-select border-0 border-bottom" name="state" id="state_for_billing" style="border-color: #b1b1b1 !important; border-radius: 0;"><option value="">Select State</option></select><label for="state_for_billing">State</label></div>');
                                $.each(states, function (key, state) {
                                    if (result.payload.state === state.state) {
                                        $('#state_for_billing').append('<option value="' + state.state + '" selected>' + state.state + '</option>');
                                    } else {
                                        $('#state_for_billing').append('<option value="' + state.state + '">' + state.state + '</option>');
                                    }
                                });
                            } else {
                                $('#state_field_holder_for_billing').append('<div class="form-floating"><input type="text" class="form-control border-0 border-bottom" name="state" id="state_for_billing" placeholder="State" value="' + result.payload.state + '" style="border-color: #b1b1b1 !important; border-radius: 0;"><label for="state_for_billing">State</label></div>');
                            }
                            $('#city_for_billing').val(result.payload.city);
                            $('#postal_code_for_billing').val(result.payload.postal_code);
                            $('#address_line_1_for_billing').val(result.payload.address_line_1);
                            $('#address_line_2_for_billing').val(result.payload.address_line_2);
                            $('#phone_field_holder_for_billing').append(`
                                <div class="row">
                                    <div class="col-4 pe-0" style="padding-top: 17px;">
                                        <div class="border-bottom" style="border-color: #b1b1b1 !important; padding-bottom: 18px;">
                                            <img src="` + result.payload.country.flag + `" style="height: 20px;">
                                            <span class="">` + result.payload.country.dialling_code + `</span>
                                        </div>
                                    </div>
                                    <div class="col-8 ps-0">
                                        <div class="form-floating">
                                            <input type="text" class="form-control border-0 border-bottom" name="phone" id="phone_for_billing" placeholder="Phone" value="` + result.payload.phone + `" style="border-color: #b1b1b1 !important; border-radius: 0;">
                                            <label for="phone_for_billing">Phone</label>
                                        </div>
                                    </div>
                                </div>
                            `);
                            $('#email_for_billing').val(result.payload.email);
                            $('#billing_address_form_submit_button_text').text('Update');
                            $('#billing_address_form_container').show(1000);
                        },
                        error: function (xhr) {
                            console.log(xhr);
                        }
                    });
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });


        $(document).on('submit', '#billing_address_form', function (event) {
            event.preventDefault();
            $('#billing_address_form').find('.invalid-feedback').remove();
            $('#billing_address_form').find('.is-invalid').removeClass('is-invalid');
            $('#billing_address_form_submit_button').addClass('disabled');
            $('#billing_address_form_submit_button_text').addClass('sr-only');
            $('#billing_address_form_submit_button_processing').removeClass('sr-only');
            let formData = new FormData(this);
            formData.append('_token', '{{ csrf_token() }}');

            let isGuest = '{{ $isGuest }}';
            let url = isGuest ? '{{ url('checkout/save/billing/address/for/guest') }}' : '{{ url('checkout/save/billing/address/for/account') }}';
            $.ajax({
                method: 'post',
                url: url,
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                global: false,
                success: function (result) {
                    console.log(result);
                    $('#billing_address_form_submit_button').removeClass('disabled');
                    $('#billing_address_form_submit_button_text').removeClass('sr-only');
                    $('#billing_address_form_submit_button_processing').addClass('sr-only');
                    $('#billing_address_form_container').hide(1000);
                    clearBillingAddressForm();
                    if (isGuest) {
                        loadBillingAddressForGuest();
                    } else {
                        loadBillingAddressForAccount();
                    }
                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#billing_address_form_submit_button').removeClass('disabled');
                    $('#billing_address_form_submit_button_text').removeClass('sr-only');
                    $('#billing_address_form_submit_button_processing').addClass('sr-only');
                    if (xhr.responseJSON.hasOwnProperty('errors')) {
                        $.each(xhr.responseJSON.errors, function (key, value) {
                            $('#' + key + '_for_billing').after('<div class="invalid-feedback"></div>');
                            $('#' + key + '_for_billing').addClass('is-invalid');
                            $.each(value, function (k, v) {
                                $('#' + key + '_for_billing').parent().find('.invalid-feedback').append('<div>' + v + '</div>');
                            });
                        })
                    }
                }
            });

        });

        $(document).on('click', '#billing_address_form_cancel_button', function () {
            clearBillingAddressForm();
            $('#billing_address_form_container').hide(1000);
            let isGuest = '{{ $isGuest }}';
            if (isGuest) {
                loadBillingAddressForGuest();
            } else {
                loadBillingAddressForAccount();
            }
        });


        //////////////////////////////////////////////////////Billing Section End//////////////////////////////////////////////////////////


        function clearCardForm() {
            $('#card_form').find('.invalid-feedback').remove();
            $('#card_form').find('.is-invalid').removeClass('is-invalid');
            $('#card_form')[0].reset();
        }


        $(document).on('click', '.delete_card_from_account', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/delete/card/from/account') }}',
                data: {
                    id: $(this).data('id')
                },
                cache: false,
                success: function (result) {
                    console.log(result);
                    loadCardsForAccount();

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });

        $(document).on('click', '.select_card_for_account', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/select/card/for/account') }}',
                data: {
                    id: $(this).data('id')
                },
                cache: false,
                success: function (result) {
                    console.log(result);
                    loadCardsForAccount();

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });

        $(document).on('click', '#add_card_for_account', function () {
            clearCardForm();
            $('#cards_container').empty().hide();
            $('#payment_option_message').removeClass('text-success').addClass('text-danger').text('Enter Your Card Details');
            $('#place_order_button_text').text('Confirm to Place Order');
            $('#place_order_button').attr('disabled', true);
            $('#card_form_container').show(1000);
        });

        $(document).on('click', '.edit_card_for_account', function () {
            let id = $(this).data('id');
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/account/card/by/id') }}',
                data: {
                    id: id
                },
                cache: false,
                success: function (result) {
                    console.log(result);
                    let cardBrandImagePath = result.payload.card_brand === 'Visa' ? '{{ asset('storage/img/application/visa-card.png') }}' : (result.payload.card_brand === 'American Express' ? '{{ asset('storage/img/application/american-express-card.png') }}' : (result.payload.card_brand === 'MasterCard' ? '{{ asset('storage/img/application/master-card.png') }}' : (result.payload.card_brand === 'Discover' ? '{{ asset('storage/img/application/discover-card.png') }}' : '')));
                    $('#card_' + id).empty();

                    let months = {
                        'January': 'January',
                        'February': 'February',
                        'March': 'March',
                        'April': 'April',
                        'May': 'May',
                        'June': 'June',
                        'July': 'July',
                        'August': 'August',
                        'September': 'September',
                        'October': 'October',
                        'November': 'November',
                        'December': 'December',
                    };

                    let monthOptions = '';
                    $.each(months, function (key, value) {
                        if (result.payload.expiry_month === value) {
                            monthOptions += '<option value="' + key + '" selected>' + value + '</option>';
                        } else {
                            monthOptions += '<option value="' + key + '">' + value + '</option>';
                        }
                    });

                    let yearOptions = '';
                    for(let i = new Date().getFullYear(); i <= new Date().getFullYear() + 10; i++) {
                        if (result.payload.expiry_year === i) {
                            yearOptions += '<option value="' + i + '" selected>' + i + '</option>';
                        } else {
                            yearOptions += '<option value="' + i + '">' + i + '</option>';
                        }
                    }


                    $('#card_' + id).append(`
                        <form id="card_form_for_edit">
                            <input type="hidden" name="id" value="` + result.payload.id + `">
                            <input type="hidden" name="card_number" value="` + result.payload.card_number + `">
                            <input type="hidden" name="first_name" value="` + result.payload.first_name + `">
                            <input type="hidden" name="last_name" value="` + result.payload.last_name + `">
                            <div class="row mt-3">
                                <div class="col-7">
                                    <div class="row">
                                        <div class="col"><img src="` + cardBrandImagePath + `" class="img-fluid"></div>
                                        <div class="col ps-0 pt-3">ending in ` + result.payload.card_number.substr(-4) + `</div>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="form-floating">
                                        <input type="text" autocomplete="off" class="form-control border-0 border-bottom" name="security_code" id="security_code_for_edit" value="` + result.payload.security_code + `" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;" placeholder="Security Code">
                                        <label for="security_code_for_edit">Security Code</label>
                                    </div>
                                </div>
                            </div>



                            <div class="row mt-4">
                                <div class="col-3 pe-0"><div class="input-group-text small border-0 border-bottom text-wrap" style="color: #615f75; border-radius: 0; height: 100%; border-color: #b1b1b1 !important;">Expiry Date</div></div>
                                <div class="col-9 ps-0">
                                    <div class="row">
                                        <div class="col pe-0">
                                            <div class="form-floating">
                                                <select class="form-select border-0 border-bottom" name="expiry_month" id="expiry_month_for_edit" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <option value="">Select Month</option>
                                                    ` + monthOptions + `
                                                </select>
                                                <label for="expiry_month_for_edit">Month</label>
                                            </div>
                                        </div>
                                        <div class="col ps-0">
                                            <div class="form-floating">
                                                <select class="form-select border-0 border-bottom" name="expiry_year" id="expiry_year_for_edit" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <option value="">Select Year</option>
                                                    ` + yearOptions + `
                                                </select>
                                                <label for="expiry_year_for_edit">Year</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="row mt-4">
                                <div class="col d-grid">
                                    <button type="submit" class="mod_button_1" id="card_form_for_edit_submit_button" style="border-radius: 0;">
                                        <span id="card_form_for_edit_submit_button_text">Update</span>
                                        <span id="card_form_for_edit_submit_button_processing" class="sr-only"><span class="spinner-grow spinner-grow-sm text-info" role="status" aria-hidden="true"></span> Processing...</span>
                                    </button>
                                </div>
                                <div class="col d-grid">
                                    <button type="button" class="mod_button_2" id="card_form_for_edit_cancel_button" style="border-radius: 0;">Cancel</button>
                                </div>
                            </div>


                        </form>
                    `);
                    $('#add_card_for_account').parent().remove();
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });

        $(document).on('submit', '#card_form_for_edit', function (event) {
            event.preventDefault();

            $('#card_form_for_edit').find('.invalid-feedback').remove();
            $('#card_form_for_edit').find('.is-invalid').removeClass('is-invalid');

            $('#card_form_for_edit_submit_button').addClass('disabled');
            $('#card_form_for_edit_submit_button_text').addClass('sr-only');
            $('#card_form_for_edit_submit_button_processing').removeClass('sr-only');
            let formData = new FormData(this);
            formData.append('_token', '{{ csrf_token() }}');

            let isGuest = '{{ $isGuest }}';
            let url = isGuest ? '{{ url('checkout/save/card/for/guest') }}' : '{{ url('checkout/save/card/for/account') }}';
            $.ajax({
                method: 'post',
                url: url,
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                global: false,
                success: function (result) {
                    console.log(result);
                    $('#card_form_for_edit_submit_button').removeClass('disabled');
                    $('#card_form_for_edit_submit_button_text').removeClass('sr-only');
                    $('#card_form_for_edit_submit_button_processing').addClass('sr-only');
                    if (result.success === true) {
                        if (isGuest) {
                            loadCardForGuest();
                        } else {
                            loadCardsForAccount();
                        }
                    } else {
                        $('#card_form_for_edit').prepend('<div class="text-danger small invalid-feedback d-block mb-4">' + result.message + '</div>');
                    }
                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#card_form_for_edit_submit_button').removeClass('disabled');
                    $('#card_form_for_edit_submit_button_text').removeClass('sr-only');
                    $('#card_form_for_edit_submit_button_processing').addClass('sr-only');
                    if (xhr.responseJSON.hasOwnProperty('errors')) {
                        $.each(xhr.responseJSON.errors, function (key, value) {
                            if (key === 'expiry_month' || key === 'expiry_year') {
                                if (key === 'expiry_month') {
                                    $('#' + key + '_for_edit').parent().parent().parent().parent().parent().after('<div class="invalid-feedback expiry_month_error_message d-block"></div>');
                                    $('#' + key + '_for_edit').addClass('is-invalid');
                                    $.each(value, function (k, v) {
                                        $('#card_form_for_edit').find('.expiry_month_error_message').append('<div>' + v + '</div>');
                                    });
                                }
                                if (key === 'expiry_year') {
                                    $('#' + key + '_for_edit').parent().parent().parent().parent().parent().after('<div class="invalid-feedback expiry_year_error_message d-block"></div>');
                                    $('#' + key + '_for_edit').addClass('is-invalid');
                                    $.each(value, function (k, v) {
                                        $('#card_form_for_edit').find('.expiry_year_error_message').append('<div>' + v + '</div>');
                                    });
                                }
                            } else {
                                $('#' + key + '_for_edit').after('<div class="invalid-feedback"></div>');
                                $('#' + key + '_for_edit').addClass('is-invalid');
                                $.each(value, function (k, v) {
                                    $('#' + key + '_for_edit').parent().find('.invalid-feedback').append('<div>' + v + '</div>');
                                });
                            }

                        })
                    }
                }
            });

        })


        $(document).on('click', '#card_form_for_edit_cancel_button', function () {
            let isGuest = '{{ $isGuest }}';
            if (isGuest) {
                loadCardForGuest();
            } else {
                loadCardsForAccount();
            }
        });

        function loadCardsForAccount() {
            $('#cards_container').hide();
            $('#card_form_container').hide();
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/account/cards') }}',
                cache: false,
                success: function (result) {
                    console.log(result);

                    if (result.payload !== null && Object.keys(result.payload).length > 0) {
                        $('#cards_container').empty();
                        let cardBrandImagePath;
                        let cardNumberLast4Digits;
                        let selectedCardLast4Digits;
                        if (result.payload.length > 1) {
                            let bottomLinks;
                            let selectedCardColor;
                            let selectedText;
                            let selectCardForCheckoutButton;
                            $.each(result.payload, function (key, card) {
                                cardBrandImagePath = card.card_brand === 'Visa' ? '{{ asset('storage/img/application/visa-card.png') }}' : (card.card_brand === 'American Express' ? '{{ asset('storage/img/application/american-express-card.png') }}' : (card.card_brand === 'MasterCard' ? '{{ asset('storage/img/application/master-card.png') }}' : (card.card_brand === 'Discover' ? '{{ asset('storage/img/application/discover-card.png') }}' : '')));
                                cardNumberLast4Digits = card.card_number.substr(-4);
                                bottomLinks = '<a href="javascript:void(0)" class="edit_card_for_account" data-id="' + card.id + '">Edit</a> | <a href="javascript:void(0)" class="delete_card_from_account" data-id="' + card.id + '">Delete</a>';
                                selectedCardColor = parseInt(card.is_selected) === 1 ? 'ghostwhite' : 'white';
                                selectedText = parseInt(card.is_selected) === 1 ? '<div style="position: absolute; left: 0; top: 0; background: #626f68; color: #fff; padding: 5px 50px;">Selected</div>' : '';
                                selectCardForCheckoutButton = parseInt(card.is_selected) === 0 ? '<button class="btn btn-outline-secondary select_card_for_account" data-id="' + card.id + '" style="position: absolute; left: 0; top: 0; border-radius: 0; padding: 5px 15px; font-size: 14px; border-color: #c9cfd5 !important;">Select for Checkout</button>' : '';
                                if (parseInt(card.is_selected) === 1) {
                                    selectedCardLast4Digits = card.card_number.substr(-4);
                                }
                                $('#cards_container').append(`
                                    <div class="ps-xxl-4 ps-xl-4 ps-lg-4 ps-md-4 ps-sm-4 p-0">
                                        <div class="card mb-4" style="background-color: ` + selectedCardColor + `; border-radius: 0;">
                                            <div class="card-body small">
                                                ` + selectedText + selectCardForCheckoutButton + `
                                                <div class="row mt-4" id="card_` + card.id + `">
                                                    <div class="col-8">
                                                        <div>` + card.card_brand + ` ending in ` + cardNumberLast4Digits + `</div>
                                                        <div class="mt-1">Expires on <span style="color: #084298;">` + card.expiry_month + '/' + card.expiry_year  + `</span></div>
                                                        <div class="mt-3">` + bottomLinks + `</div>
                                                    </div>
                                                    <div class="col-4"><img src="` + cardBrandImagePath + `" class="img-fluid"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                `);
                            });
                        } else {
                            $.each(result.payload, function (key, card) {
                                cardBrandImagePath = card.card_brand === 'Visa' ? '{{ asset('storage/img/application/visa-card.png') }}' : (card.card_brand === 'American Express' ? '{{ asset('storage/img/application/american-express-card.png') }}' : (card.card_brand === 'MasterCard' ? '{{ asset('storage/img/application/master-card.png') }}' : (card.card_brand === 'Discover' ? '{{ asset('storage/img/application/discover-card.png') }}' : '')));
                                cardNumberLast4Digits = card.card_number.substr(-4);
                                selectedCardLast4Digits = card.card_number.substr(-4);
                                $('#cards_container').append(`
                                    <div class="ps-xxl-4 ps-xl-4 ps-lg-4 ps-md-4 ps-sm-4 p-0">
                                        <div class="card" style="border-radius: 0;">
                                            <div class="card-body small">
                                                <div class="row mt-3" id="card_` + card.id + `">
                                                    <div class="col-8">
                                                        <div>` + card.card_brand + ` ending in ` + cardNumberLast4Digits + `</div>
                                                        <div>Expires on ` + card.expiry_month + '/' + card.expiry_year  + `</div>
                                                        <div class="mt-3">
                                                            <a href="javascript:void(0)" class="edit_card_for_account" data-id="` + card.id + `">Edit</a> | <a href="javascript:void(0)" class="delete_card_from_account" data-id="` + card.id + `">Delete</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <img src="` + cardBrandImagePath + `" class="img-fluid">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                `);
                            });
                        }
                        if (result.payload.length < 3) {
                            $('#cards_container').append('<div class="mt-4 ps-4 d-grid"><button type="button" class="mod_button_1" id="add_card_for_account" style="border-radius: 0;">Add New Card</button></div>');
                        }

                        $('#cards_container').show(1000);
                        $('#payment_option_message').removeClass('text-danger').addClass('text-success').text('You will finish checkout with card ending in ' + selectedCardLast4Digits);
                        $('#place_order_button_text').text('Place Order');
                        $('#place_order_button').removeAttr('disabled');
                    } else {
                        $('#payment_option_message').removeClass('text-success').addClass('text-danger').text('Enter Your Card Details');
                        $('#place_order_button_text').text('Confirm to Place Order');
                        $('#place_order_button').attr('disabled', true);
                        $('#card_form_container').show(1000);
                    }

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        }

        function loadCardForGuest() {
            $('#cards_container').hide();
            $('#card_form_container').hide();
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/guest/card') }}',
                cache: false,
                success: function (result) {
                    console.log(result);
                    if (result.payload !== null && Object.keys(result.payload).length > 0) {

                    } else {

                    }
                    if (result.payload !== null) {

                        $('#cards_container').empty();

                        let cardBrandImagePath = result.payload.card_brand === 'Visa' ? '{{ asset('storage/img/application/visa-card.png') }}' : (result.payload.card_brand === 'American Express' ? '{{ asset('storage/img/application/american-express-card.png') }}' : (result.payload.card_brand === 'MasterCard' ? '{{ asset('storage/img/application/master-card.png') }}' : (result.payload.card_brand === 'Discover' ? '{{ asset('storage/img/application/discover-card.png') }}' : '')));

                        $('#cards_container').append(`
                            <div class="ps-xxl-4 ps-xl-4 ps-lg-4 ps-md-4 ps-sm-4 p-0">
                                <div class="card">
                                    <div class="card-body small">
                                        <div class="row" id="card_` + result.payload.card_number + `">
                                            <div class="col-8">
                                                <div>` + result.payload.card_brand + ` ending in ` + result.payload.card_number.substr(-4) + `</div>
                                                <div>Expires on ` + result.payload.expiry_month + '/' + result.payload.expiry_year  + `</div>
                                                <div class="mt-3">
                                                    <a href="javascript:void(0)" id="edit_card_for_guest" data-card_number="` + result.payload.card_number + `">Edit</a> | <a href="javascript:void(0)" id="delete_card_for_guest">Delete</a>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <img src="` + cardBrandImagePath + `" class="img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `);
                        $('#cards_container').show(1000);
                        $('#payment_option_message').removeClass('text-danger').addClass('text-success').text('You will finish checkout with card ending in ' + result.payload.card_number.substr(-4));
                        $('#place_order_button_text').text('Place Order');
                        $('#place_order_button').removeAttr('disabled');

                    } else {
                        $('#payment_option_message').removeClass('text-success').addClass('text-danger').text('Enter Your Card Details');
                        $('#place_order_button_text').text('Confirm to Place Order');
                        $('#place_order_button').attr('disabled', true);
                        $('#card_form_container').show(1000);
                    }

                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        }


        $(document).on('click', '#edit_card_for_guest', function () {
            let cardNumber = $(this).data('card_number');
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/get/guest/card') }}',

                cache: false,
                success: function (result) {
                    console.log(result);
                    let cardBrandImagePath = result.payload.card_brand === 'Visa' ? '{{ asset('storage/img/application/visa-card.png') }}' : (result.payload.card_brand === 'American Express' ? '{{ asset('storage/img/application/american-express-card.png') }}' : (result.payload.card_brand === 'MasterCard' ? '{{ asset('storage/img/application/master-card.png') }}' : (result.payload.card_brand === 'Discover' ? '{{ asset('storage/img/application/discover-card.png') }}' : '')));
                    $('#card_' + cardNumber).empty();
                    let months = {
                        'January': 'January',
                        'February': 'February',
                        'March': 'March',
                        'April': 'April',
                        'May': 'May',
                        'June': 'June',
                        'July': 'July',
                        'August': 'August',
                        'September': 'September',
                        'October': 'October',
                        'November': 'November',
                        'December': 'December',
                    };

                    let monthOptions = '';
                    $.each(months, function (key, value) {
                        if (result.payload.expiry_month === value) {
                            monthOptions += '<option value="' + key + '" selected>' + value + '</option>';
                        } else {
                            monthOptions += '<option value="' + key + '">' + value + '</option>';
                        }
                    });

                    let yearOptions = '';
                    for(let i = new Date().getFullYear(); i <= new Date().getFullYear() + 10; i++) {
                        if (parseInt(result.payload.expiry_year) === i) {
                            yearOptions += '<option value="' + i + '" selected>' + i + '</option>';
                        } else {
                            yearOptions += '<option value="' + i + '">' + i + '</option>';
                        }
                    }


                    $('#card_' + cardNumber).append(`
                        <form id="card_form_for_edit">

                            <input type="hidden" name="card_number" value="` + result.payload.card_number + `">
                            <input type="hidden" name="first_name" value="` + result.payload.first_name + `">
                            <input type="hidden" name="last_name" value="` + result.payload.last_name + `">
                            <div class="row mt-3">
                                <div class="col-7">
                                    <div class="row">
                                        <div class="col"><img src="` + cardBrandImagePath + `" class="img-fluid"></div>
                                        <div class="col ps-0 pt-3">ending in ` + result.payload.card_number.substr(-4) + `</div>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="form-floating">
                                        <input type="text" autocomplete="off" class="form-control border-0 border-bottom" name="security_code" id="security_code_for_edit" value="` + result.payload.security_code + `" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                        <label for="security_code_for_edit">Security Code</label>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-4">
                                <div class="col-3 pe-0"><div class="input-group-text small border-0 border-bottom text-wrap" style="color: #615f75; border-radius: 0; height: 100%; border-color: #b1b1b1 !important;">Expiry Date</div></div>
                                <div class="col-9 ps-0">
                                    <div class="row">
                                        <div class="col pe-0">
                                            <div class="form-floating">
                                                <select class="form-select border-0 border-bottom" name="expiry_month" id="expiry_month_for_edit" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <option value="">Select Month</option>
                                                    ` + monthOptions + `
                                                </select>
                                                <label for="expiry_month_for_edit">Month</label>
                                            </div>
                                        </div>
                                        <div class="col ps-0">
                                            <div class="form-floating">
                                                <select class="form-select border-0 border-bottom" name="expiry_year" id="expiry_year_for_edit" style="font-size: 12px; border-color: #b1b1b1 !important; border-radius: 0;">
                                                    <option value="">Select Year</option>
                                                    ` + yearOptions + `
                                                </select>
                                                <label for="expiry_year_for_edit">Year</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-4">
                                <div class="col d-grid">
                                    <button type="submit" class="mod_button_1" id="card_form_for_edit_submit_button" style="border-radius: 0;">
                                        <span id="card_form_for_edit_submit_button_text">Update</span>
                                        <span id="card_form_for_edit_submit_button_processing" class="sr-only"><span class="spinner-grow spinner-grow-sm text-info" role="status" aria-hidden="true"></span> Processing...</span>
                                    </button>
                                </div>
                                <div class="col d-grid">
                                    <button type="button" class="mod_button_2" id="card_form_for_edit_cancel_button" style="border-radius: 0;">Cancel</button>
                                </div>
                            </div>


                        </form>
                    `);
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });


        $(document).on('click', '#delete_card_for_guest', function () {
            $.ajax({
                method: 'get',
                url: '{{ url('checkout/delete/guest/card') }}',
                cache: false,
                success: function (result) {
                    console.log(result);
                    clearCardForm();
                    loadCardForGuest();
                },
                error: function (xhr) {
                    console.log(xhr);
                }
            });
        });


        $(document).on('click', '.payment_option', function () {
            if ($(this).val() === 'Card') {

                let isGuest = '{{ $isGuest }}';
                if (isGuest) {
                    loadCardForGuest();
                } else {
                    loadCardsForAccount();
                }

            } else if ($(this).val() === 'PayPal') {
                $('#payment_option_message').removeClass('text-danger').addClass('text-success').text('You will finish checkout with PayPal');
                $('#place_order_button_text').text('Place Order');
                $('#place_order_button').removeAttr('disabled');
                $('#cards_container').hide(1000);
                $('#card_form_container').hide(1000);
            }
            return true;
        });


        $(document).on('submit', '#card_form', function (event) {
            event.preventDefault();

            $('#card_form').find('.invalid-feedback').remove();
            $('#card_form').find('.is-invalid').removeClass('is-invalid');

            $('#card_form_submit_button').addClass('disabled');
            $('#card_form_submit_button_text').addClass('sr-only');
            $('#card_form_submit_button_processing').removeClass('sr-only');
            let formData = new FormData(this);
            formData.append('_token', '{{ csrf_token() }}');

            let isGuest = '{{ $isGuest }}';
            let url = isGuest ? '{{ url('checkout/save/card/for/guest') }}' : '{{ url('checkout/save/card/for/account') }}';
            $.ajax({
                method: 'post',
                url: url,
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                global: false,
                success: function (result) {
                    console.log(result);
                    $('#card_form_submit_button').removeClass('disabled');
                    $('#card_form_submit_button_text').removeClass('sr-only');
                    $('#card_form_submit_button_processing').addClass('sr-only');

                    if (result.success === true) {
                        if (isGuest) {
                            loadCardForGuest();
                        } else {
                            loadCardsForAccount();
                        }
                        $('#cards_container').before('<div id="card_saved_alert"></div>');
                        $('#card_saved_alert').addClass('alert alert-success alert-dismissible fade show mt-4').attr('role', 'alert').css('margin-left', '25px').append('<div>The card ending in ' + result.payload.card_number.substr(-4) + ' has been saved.</div>').append('<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>');
                        setTimeout(function() {
                            $("#card_saved_alert").alert('close');
                        }, 10000);
                    } else {
                        $('#card_form').prepend('<div class="text-danger small invalid-feedback d-block mb-4">' + result.message + '</div>');
                    }



                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#card_form_submit_button').removeClass('disabled');
                    $('#card_form_submit_button_text').removeClass('sr-only');
                    $('#card_form_submit_button_processing').addClass('sr-only');
                    if (xhr.responseJSON.hasOwnProperty('errors')) {

                        $.each(xhr.responseJSON.errors, function (key, value) {
                            if (key === 'expiry_month' || key === 'expiry_year' || key === 'first_name' || key === 'last_name') {
                                if (key === 'expiry_month') {
                                    $('#' + key).parent().parent().parent().parent().parent().after('<div class="invalid-feedback expiry_month_error_message d-block"></div>');
                                    $('#' + key).addClass('is-invalid');
                                    $.each(value, function (k, v) {
                                        $('#card_form').parent().parent().find('.expiry_month_error_message').append('<div>' + v + '</div>');
                                    });
                                }
                                if (key === 'expiry_year') {
                                    $('#' + key).parent().parent().parent().parent().parent().after('<div class="invalid-feedback expiry_year_error_message d-block"></div>');
                                    $('#' + key).addClass('is-invalid');
                                    $.each(value, function (k, v) {
                                        $('#card_form').find('.expiry_year_error_message').append('<div>' + v + '</div>');
                                    });
                                }

                                if (key === 'first_name') {
                                    $('#' + key + '_for_card').parent().parent().parent().parent().parent().after('<div class="invalid-feedback first_name_for_card_error_message d-block"></div>');
                                    $('#' + key + '_for_card').addClass('is-invalid');
                                    $.each(value, function (k, v) {
                                        $('#card_form').find('.first_name_for_card_error_message').append('<div>' + v + '</div>');
                                    });
                                }
                                if (key === 'last_name') {
                                    $('#' + key + '_for_card').parent().parent().parent().parent().parent().after('<div class="invalid-feedback last_name_for_card_error_message d-block"></div>');
                                    $('#' + key + '_for_card').addClass('is-invalid');
                                    $.each(value, function (k, v) {
                                        $('#card_form').find('.last_name_for_card_error_message').append('<div>' + v + '</div>');
                                    });
                                }
                            } else {
                                $('#' + key).after('<div class="invalid-feedback"></div>');
                                $('#' + key).addClass('is-invalid');
                                $.each(value, function (k, v) {
                                    $('#' + key).parent().find('.invalid-feedback').append('<div>' + v + '</div>');
                                });
                            }

                        })
                    }
                }
            });

        });

        $(document).on('click', '#card_form_cancel_button', function () {
            clearCardForm();
            $('#cards_container').empty().hide();
            $('#card_form_container').hide(1000);
            $('.payment_option').prop('checked', false);
            $('#payment_option_message').removeClass('text-success').addClass('text-danger').text('Select a Payment Option');
            $('#place_order_button_text').text('Confirm to Place Order');
            $('#place_order_button').attr('disabled', true);
        });




        $(document).on('change', '#create_an_account', function () {
            if ($(this).is(':checked') === true) {
                $('#first_name_for_account').removeAttr('disabled');
                $('#last_name_for_account').removeAttr('disabled');
                $('#email_for_account').removeAttr('disabled');
                $('#password_for_account').removeAttr('disabled');
                $('#create_an_account').parent().css('padding-top', '0');
                $('#account_information_details').show(1000);
            } else {
                $('#first_name_for_account').attr('disabled', true);
                $('#last_name_for_account').attr('disabled', true);
                $('#email_for_account').attr('disabled', true);
                $('#password_for_account').attr('disabled', true);
                $('#create_an_account').parent().css('padding-top', '75px');
                $('#account_information_details').hide(1000);
            }
            return true;
        });


        $(document).on('click', '#place_order_button', function () {
            let formData = new FormData();
            formData.append('_token', '{{ csrf_token() }}');
            formData.append('payment_option', $('.payment_option:checked').val());
            $.ajax({
                method: 'post',
                url: '{{ url('checkout') }}',
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                success: function (result) {
                    console.log(result);
                    if (result.success === false) {
                        $('#payment_option_message').text(result.message);
                    } else if (result.success === true) {
                        location = '{{ url('checkout/success') }}';
                    }
                },
                error: function (xhr) {
                    console.log(xhr);

                }
            });
        });


    </script>



@endsection
