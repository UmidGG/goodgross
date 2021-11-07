@extends('Layouts.frontend')
@section('content')


    @php
        $orderSubTotal = 0;
    @endphp
    @foreach($order->orderTransactions as $orderTransaction)
        @php
            $orderSubTotal += $orderTransaction->quantity * $orderTransaction->price_per_unit;
        @endphp
    @endforeach

    <div class="container-fluid bg-white">

        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12 mx-auto">

                <div class="row mt-4">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 col-xxl-12 border-bottom pb-2" style="border-color: #e8f3ed !important;">
                        <div class="page_identity_line">
                            <a href="{{ url('/') }}">Home</a> . Order Confirmation
                        </div>
                    </div>
                </div>


                <div class="row mt-4">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-8 col-xxl-7 mx-auto">


{{--                        <div class="row mt-4 border-bottom pb-4" style="border-color: #e8f3ed !important;">--}}
{{--                            <div class="col text-center">--}}
{{--                                <div><i class="far fa-check-circle text-success fa-3x"></i></div>--}}
{{--                                <div class="mt-3 text-success">Order Placed Successfully</div>--}}
{{--                            </div>--}}
{{--                        </div>--}}


                        <div class="row mt-4 border-bottom pb-4" style="border-color: #e8f3ed !important;">
                            <div class="col">
{{--                                <div>Hi {{ $order->account->type === 'Personal' ? $order->account->personalAccount->first_name : ($order->account->type === 'Business' ? $order->account->businessAccount->name : $order->account->guestAccount->first_name) }},</div>--}}
                                <div>Hi Guest,</div>
                                <div class="mt-2 lead">
                                    <i class="fas fa-check text-success"></i> <span class="text-success">Your order has been confirmed.</span>
                                </div>
                                <div class="mt-2 text-justify">
                                    Thanks you so much for shopping with us. Your order is being processed for shipping and you will be notified soon by email.
                                </div>

                            </div>
                        </div>

                        <div class="row mt-4 border-bottom" style="border-color: #e8f3ed !important;">
                            <div class="col-12 col-sm-6">
                                <div class="pt-xxl-3">Order: <span class="font-weight-bold"><a href="#" class="text-success text-decoration-none">{{ $order->number }}</a></span></div>
                                <div class="mt-2"><button type="button" class="btn primary_btn_default">Track or Manage Order</button></div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <table class="table table-borderless w-100">
                                    <tbody class="text-end">
                                    <tr>
                                        <td><div class="text-secondary">Sub Total</div></td>
                                        <td><div class="text-secondary">US ${{ number_format($orderSubTotal, 2) }}</div></td>
                                    </tr>
                                    <tr>
                                        <td><div class="text-secondary">Tax</div></td>
                                        <td><div class="text-secondary">US ${{ number_format(0, 2) }}</div></td>
                                    </tr>
                                    <tr>
                                        <td><div class="text-primary">Order Total</div></td>
                                        <td><div class="text-primary">US ${{ number_format($orderSubTotal, 2) }}</div></td>
                                    </tr>
                                    </tbody>
                                </table>



                            </div>
                        </div>





                        <div class="row mt-4 border-bottom" style="border-color: #e8f3ed !important;">
                            <div class="col">

                                @foreach($order->orderTransactions as $orderTransaction)

                                    <div class="shadow-sm mb-4 p-3">
                                        <div class="row">
                                            <div class="col-6 col-sm-4 col-md-3 col-lg-3 col-xl-2 col-xxl-2">
                                                <img src="{{ asset('storage/' . $orderTransaction->product->productProperties->where('property.property', 'Images')->first('value')->value) }}" class="img-fluid" alt="Image">
                                            </div>
                                            <div class="col-6 col-sm-8 col-md-9 col-lg-8 col-xl-8 col-xxl-8">
                                                <div><a href="#" class="text-success text-decoration-none">{{ $orderTransaction->product->productProperties->where('property.property', 'Title')->first('value')->value }}</a></div>
                                                <div class="small">
                                                    <span class="text-secondary">Sold by: </span>
                                                    <span><a href="#" class="text-primary text-decoration-none">{{ $orderTransaction->product->account->type === 'Personal' ? $orderTransaction->product->account->personalAccount->first_name . ' ' . $orderTransaction->product->account->personalAccount->last_name . ' [' . $orderTransaction->product->account->number . ']' : $orderTransaction->product->account->businessAccount->name . ' [' . $orderTransaction->product->account->number . ']' }}</a></span>
                                                </div>
                                                <div class="small">
                                                    <span class="text-secondary">Price Per Unit:</span>
                                                    <span class="text-warning">US ${{ number_format($orderTransaction->price_per_unit, 2) }}</span>
                                                </div>
                                                <div class="small">
                                                    <span class="text-secondary">Quantity:</span>
                                                    <span class="text-info">{{ $orderTransaction->quantity }}</span>
                                                </div>

                                            </div>
                                            <div class="col-12 col-sm-12 col-md-12 col-lg-1 col-xl-2 col-xxl-2">
                                                <div class="text-end text-secondary">US ${{ number_format($orderTransaction->price_per_unit * $orderTransaction->quantity, 2) }}</div>
                                            </div>
                                        </div>
                                    </div>

                                @endforeach

                            </div>
                        </div>

                        <div class="row my-4">
                            <div class="col">
                                <div class="shadow-sm p-3">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 border-end">
                                            <div class="text-success">Shipping To</div>
                                            <div class="small">
                                                <div>{{ $order->orderShipping->first_name }} {{ $order->orderShipping->first_name }}</div>
                                                <div>{{ $order->orderShipping->address_line_1 }}</div>
                                                <div>{{ $order->orderShipping->address_line_2 }}</div>
                                                <div>{{ $order->orderShipping->city }} {{ $order->orderShipping->state }} {{ $order->orderShipping->postal_code }}</div>
                                                <div>{{ $order->orderShipping->country }}</div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6">
                                            <div class="text-secondary mt-4">Estimated Delivery</div>
                                            <div class="small">{{ date('F d, Y', strtotime('+7 days', strtotime(date('Y-m-d')))) }} - {{ date('F d, Y', strtotime('+10 days', strtotime(date('Y-m-d')))) }}</div>



                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>









                    </div>
                </div>














            </div>
        </div>
    </div>
    <div class="mt-3"></div>






@endsection
