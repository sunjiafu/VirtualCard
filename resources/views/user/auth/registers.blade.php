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
                                {{ __("Please input your details and register to your account to get access to your dashboard.") }}

                        </div>

                        <form class="ud-login-form" action="{{ setRoute('user.register.submit') }}" method="POST">
                            @csrf

                          
                            <div class="ud-form-group">
                                <input type="text" class="form-control " name="register_username" placeholder="{{ __("Username") }}" required value="{{ old('username') }}">

                            </div>
                            <div class="ud-form-group">
                                <input type="email" class="form-control " name="register_email" placeholder="{{ __("Email") }}" required value="{{ old('register_email') }}">

                            </div>

                            <div class="ud-form-group">
                                <input type="password" name="register_password" class="form-control" required placeholder="{{ __("password") }}">

                            </div>

              
                            <div class="col-lg-12 form-group">
                                @if($basic_settings->agree_policy)
                                <div class="form-group custom-check-group mb-4">
                                    <input type="checkbox" id="level-1" name="agree">
                                    <label for="level-1" class="mb-0">{{ __('I have agreed with') }} <a
                                            href="javascrip:void(0)"
                                            class="text--base">{{ __('Terms Of Use & Privacy Policy') }}</a></label>
                                </div>
                                @endif
                                @error('agree')
                                    <span class="invalid-feedback d-block" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>



                            <div class="ud-form-group">
                                <button type="submit" class="ud-main-btn w-100">{{__("Register Now")}}</button>
                            </div>
                        </form>

                        <div class="col-lg-12 text-center">
                            <div class="account-item mt-10">
                                <label>{{ __("Already Have An Account?") }}<a href="{{ route('user.login') }}" class="text--base">{{ __("Login Now") }}</a></label>
                            </div>
                     
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ====== Login End ====== -->
    <!-- ====== Login End ====== -->
@endsection
@push('script')

@endpush
