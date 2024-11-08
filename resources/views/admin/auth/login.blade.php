@extends('admin.auth.layouts.auth-master')
@php
    $app_mode = strtolower(env('APP_MODE'));
@endphp
@section('section')
    <div class="account-wrapper">
        <div class="account-header">
            <div class="site-logo">
                {{-- <img src="{{ get_logo($basic_settings) }}" alt="logo"> --}}
            </div>
            <span class="inner-title">👋</span>
            <h6 class="sub-title">{{ __("Welcome To") }} <span>{{ __("Admin Panel") }}</span></h6>
        </div>
        <form class="account-form" action="{{ setRoute('admin.login.submit') }}" method="POST">
            @csrf
            <div class="form-group">
                <input type="text" class="@error('email') is-invalid @enderror" title="Enter Username" required name="email" value="{{old('email') }}" autofocus>
                <label>{{ __("Email Address") }}</label>

                @error('email')
                    <div class="alert alert-danger">{{ $message }}</div>
                @enderror
            </div>
            <div class="form-group show_hide_password">
                <input type="password" title="Enter password" required name="password" value="">
                <button type="button" class="show-pass"><i class="fa fa-eye-slash" aria-hidden="true"></i></button>
                <label>{{ __("Password") }}</label>
            </div>
            <div class="form-group">
                <div class="forgot-item">
                    <p><a href="{{ setRoute('admin.password.forgot') }}" class="text--base">{{ __("forget Password") }}{{ "?" }}</a></p>
                </div>
            </div>
            <div class="form-group">
                <label for="captcha">验证码</label>
                <div class="captcha">
                    <img src="{{ captcha_src('flat') }}" onclick="this.src='{{ captcha_src('flat') }}'+Math.random()" title="点击刷新验证码">
                </div>
                <input id="captcha" type="text" class="form-control" name="captcha" required placeholder="请输入验证码">
                @if ($errors->has('captcha'))
                    <span class="text-danger">{{ $errors->first('captcha') }}</span>
                @endif
            </div>
            <div class="form-group">
                <label for="google2fa_code">谷歌验证码（如已启用两步验证）</label>
                <input type="text" name="google2fa_code" id="google2fa_code" class="form-control" placeholder="请输入谷歌验证码">
                @if ($errors->has('google2fa_code'))
                    <span class="text-danger">{{ $errors->first('google2fa_code') }}</span>
                @endif
            </div>
            <button type="submit" class="btn--base w-100 btn-loading">{{ __("Login") }}</button>
        </form>
    </div>
@endsection
