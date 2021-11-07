@extends('Layouts.account')

@section('content')

    <div class="mt-5">
        <ul class="nav small">
            <li class="nav-item">
                @if($activeNav === 'Account Settings')
                    <a class="nav-link active disabled border-bottom" aria-current="page" tabindex="-1" aria-disabled="true" href="{{ url('account/settings') }}">Account</a>
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





    <script type="text/javascript">


    </script>



@endsection
