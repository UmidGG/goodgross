@extends('Layouts.account_panel')

@section('content')

    <div class="mt-5">
        <ul class="nav nav-tabs small">
            <li class="nav-item">
                @if($activeNav === 'Account Settings')
                    <a class="nav-link active disabled" aria-current="page" tabindex="-1" aria-disabled="true" href="{{ url('account/settings') }}">Account</a>
                @else
                    <a class="nav-link text-secondary" href="{{ url('account/settings') }}">Account</a>
                @endif
            </li>
            <li class="nav-item">
                @if($activeNav === 'Password Settings')
                    <a class="nav-link active disabled" aria-current="page" tabindex="-1" aria-disabled="true" href="#">Password</a>
                @else
                    <a class="nav-link text-secondary" href="#">Password</a>
                @endif
            </li>
            <li class="nav-item">
                @if($activeNav === 'Notification Settings')
                    <a class="nav-link active disabled" aria-current="page" tabindex="-1" aria-disabled="true" href="#">Notification</a>
                @else
                    <a class="nav-link text-secondary" href="#">Notification</a>
                @endif
            </li>
        </ul>
    </div>

    <div class="row mt-4">
        <div class="col-12 col-sm-12 col-md-6 border-end">
            <div class="row">
                <div class="col-10">
                    <div>User Profile</div>
                    <div style="font-size: 12px;" class="text-secondary">User sign in related information</div>
                </div>
                <div class="col-2 text-end">
                    <span style="padding: 5px 7px; border-radius: 50%; background-color: #e2e3e2;"><a href="#" class="text-decoration-none"><i class="fas fa-pencil-alt"></i></a></span>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-3 col-sm-3 col-md-4 col-lg-3 col-xl-3 col-xxl-3">
                    <div style="position: relative;">
                        <div style="background-color: #73b9df; padding: 3px 7px; border-radius: 50%; position: absolute; border: 2px solid #fff;">
                            <a href="#" class="text-decoration-none"><i class="fas fa-camera" style="color: darkblue;"></i></a>
                        </div>
                        <img src="{{ asset('storage/img/application/icons8-male-user-100.png') }}" class="img-fluid">
                    </div>
                </div>
                <div class="col-9 col-sm-9 col-md-8 col-lg-9 col-xl-9 col-xxl-9">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="display_name" name="name" placeholder="Display Name" value="{{ auth()->user()->name }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                        <label for="display_name">Display Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="email" placeholder="Email" value="{{ auth()->user()->email }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                        <label for="email">Email</label>
                    </div>
                    <div class="input-group">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="password" placeholder="Password" value="{{ substr(auth()->user()->password, 0, 20) }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                            <label for="email">Password</label>
                        </div>
                        <span class="mt-4"><i class="far fa-eye"></i></span>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-12 col-sm-12 col-md-6">

            <div class="row">
                <div class="col-10">
                    <div>Account Profile</div>
                    <div style="font-size: 12px;" class="text-secondary">Account related information</div>
                </div>
                <div class="col-2 text-end">
                    <span style="padding: 5px 7px; border-radius: 50%; background-color: #e2e3e2;"><a href="#" class="text-decoration-none"><i class="fas fa-pencil-alt"></i></a></span>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="account_number" name="account_number" placeholder="Account Number" value="{{ auth()->user()->account->number }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                        <label for="account_number">Account Number</label>
                    </div>
                </div>
                <div class="col">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="account_type" name="account_type" placeholder="Account Type" value="{{ auth()->user()->account->type }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                        <label for="account_type">Account Type</label>
                    </div>
                </div>
            </div>

            @if(auth()->user()->account->type === 'Personal')

            @elseif(auth()->user()->account->type === 'Business')
                <div class="row">
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="business_type" name="business_type" placeholder="Business Type" value="{{ auth()->user()->account->businessAccount->type }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                            <label for="business_type">Business Type</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="business_name" name="business_name" placeholder="Business Name" value="{{ auth()->user()->account->businessAccount->name }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                            <label for="business_name">Business Name</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="form-floating">
                            <select class="form-control" id="business_country" name="business_country" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                                <option value="">Select Country</option>
                                @foreach($countries as $country)
                                    @if($country->id === auth()->user()->account->businessAccount->country_id)
                                        <option value="{{ $country->id }}" selected>{{ $country->name }}</option>
                                    @else
                                        <option value="{{ $country->id }}">{{ $country->name }}</option>
                                    @endif
                                @endforeach
                            </select>
                            <label for="business_country">Country</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            @if(count(auth()->user()->account->businessAccount->country->states) > 0)
                                <select class="form-control" id="business_state" name="business_state" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                                    <option value="">Select State</option>
                                    @foreach(auth()->user()->account->businessAccount->country->states as $state)
                                        @if($state->state === auth()->user()->account->businessAccount->state)
                                            <option value="{{ $state->state }}" selected>{{ $state->state }}</option>
                                        @else
                                            <option value="{{ $state->state }}">{{ $state->state }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            @else
                                <input type="text" class="form-control" id="business_state" name="business_state" placeholder="State" value="{{ auth()->user()->account->businessAccount->state }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                            @endif
                            <label for="business_state">State</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating">
                    <input type="text" class="form-control" id="business_address" name="business_address" placeholder="Address" value="{{ auth()->user()->account->businessAccount->address }}" disabled style="background-color: rgb(255 255 255); border-bottom: 0 !important;">
                    <label for="business_address">Address</label>
                </div>
            @endif


        </div>
    </div>








    <script type="text/javascript">

        $(document).ready(function () {

        });

        function getUserRelatedInformation() {

        }

        function getAccountRelatedInformation() {

        }

    </script>



@endsection
