@extends('admin.layouts.master')

@section('content')
<div class="container">
    <h2>谷歌两步验证设置</h2>

    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if(!$user->google2fa_enabled)
        <p>当前未启用两步验证。</p>
        <p>请使用谷歌身份验证器扫描以下二维码：</p>
        <div>
            {!! $QR_Image !!}
        </div>
        <p>如果无法扫描二维码，请手动输入密钥：</p>
        <p><strong>{{ $user->google2fa_secret }}</strong></p>

        <form method="POST" action="{{ route('admin.2fa.enable') }}">
            @csrf
            <div class="form-group">
                <label for="verify-code">输入验证码以启用两步验证：</label>
                <input type="text" id="verify-code" name="verify-code" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">启用两步验证</button>
        </form>
    @else
        <p>两步验证已启用。</p>
        <form method="POST" action="{{ route('admin.2fa.disable') }}">
            @csrf
            <button type="submit" class="btn btn-danger">禁用两步验证</button>
        </form>
    @endif
</div>
@endsection 