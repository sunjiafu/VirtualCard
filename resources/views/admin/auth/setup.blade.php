@extends('admin.layouts.master')

@section('content')
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3>谷歌两步验证设置</h3>
        </div>
        <div class="card-body">
            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if(session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif

            <div class="row">
                <div class="col-md-6">
                    <h4>当前状态：{{ $user->google2fa_enabled ? '已启用' : '未启用' }}</h4>
                    
                    @if(!$user->google2fa_enabled)
                        <div class="setup-section">
                            <h5>设置步骤：</h5>
                            <ol>
                                <li>下载并安装 Google Authenticator 应用</li>
                                <li>使用应用扫描下方二维码</li>
                                <li>输入应用显示的6位验证码进行验证</li>
                            </ol>

                            <div class="qr-code">
                                {!! QrCode::size(200)->generate($qrCodeUrl) !!}
                            </div>

                            <div class="secret-key">
                                <p>密钥（如果无法扫描二维码，可以手动输入）：</p>
                                <code>{{ $user->google2fa_secret }}</code>
                            </div>

                            <form action="{{ route('admin.2fa.enable') }}" method="POST" class="mt-3">
                                @csrf
                                <div class="form-group">
                                    <label>验证码</label>
                                    <input type="text" name="code" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-primary">启用两步验证</button>
                            </form>
                        </div>
                    @else
                        <form action="{{ route('admin.2fa.disable') }}" method="POST" class="mt-3">
                            @csrf
                            <div class="form-group">
                                <label>输入验证码以禁用两步验证</label>
                                <input type="text" name="code" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-danger">禁用两步验证</button>
                        </form>

                        <form action="{{ route('admin.2fa.reset') }}" method="POST" class="mt-3">
                            @csrf
                            <button type="submit" class="btn btn-warning">重置两步验证</button>
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection