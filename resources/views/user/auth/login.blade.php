@extends('frontend.layouts.auth')
@php
    $defualt = get_default_language_code() ?? 'en';
    $auth_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::AUTH_SECTION);
    $auth = App\Models\Admin\SiteSections::getData($auth_slug)->first();

@endphp


@section(section: 'content')
    {{-- Banner Start --}}

    <section class="ud-page-banner">
        <div class="container-up">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ud-banner-content">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ====== Banner End ====== -->
    <!-- ====== Login Start ====== -->
    <section class="ud-login">

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ud-login-wrapper">
                        <div class="ud-login-logo">
                            <img src="{{ get_logo($basic_settings) }}"
                                data-white_img="{{ get_logo($basic_settings, 'white') }}" alt="logo" />
                                {{ __("Login Information") }}
                        </div>

                        <form class="ud-login-form account-form " action="{{ setRoute('user.login.submit') }}" method="POST" >
                            @csrf

                            <div class="ud-form-group">

                                <input type="email" required class="form-control form--control" name="credentials" placeholder="{{__("Email")}}" spellcheck="false" data-ms-editor="true" value="{{@$app_mode == 'demo' ? 'user@appdevs.net': old('credentials') }}">

                            </div>
                            <div class="ud-form-group show_hide_password">
                                <input type="password" name="password" class="form-control form--control  "  placeholder="{{ __("password") }}" required value="{{ @$app_mode == 'demo' ? 'appdevs':'' }}">
                                {{-- <a href="javascript:void(0)" class="show-pass"><i class="fa fa-eye-slash" aria-hidden="true"></i></a> --}}
                            </div>
                            
                          

                            <div class="ud-form-group">
                                <button type="submit" class="ud-main-btn w-100">{{__("Login Now")}}</button>
                            </div>
                        </form>

                        <div class="ud-socials-connect">

                         
                      <a class="forget-pass" href="{{ setRoute('user.password.forgot') }}">{{ __("forget Password") }}{{ "?" }}</a>

                      <p class="signup-option">
                        {{ __("Don't Have An Account?") }}<a href="{{ route('user.register') }}">{{ __("Register Now") }} </a>
                      </p>
                         
                    
                     
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ====== Login End ====== -->
    <!-- ====== Login End ====== -->
@endsection
