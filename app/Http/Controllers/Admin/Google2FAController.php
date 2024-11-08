<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use PragmaRX\Google2FAQRCode\Google2FA;
use Illuminate\Support\Facades\Auth;

class Google2FAController extends Controller
{
    /**
     * 显示两步验证设置页面
     */
    public function show()
    {
        $user = Auth::guard('admin')->user();
        $google2fa = new Google2FA();

        // 如果用户还没有密钥，生成一个新的
        if (empty($user->google2fa_secret)) {
            $user->google2fa_secret = $google2fa->generateSecretKey();
            $user->save();
        }

        // 生成二维码URL
        $QR_Image = $google2fa->getQRCodeInline(
            config('app.name'),
            $user->email,
            $user->google2fa_secret
        );

        return view('admin.google2fa.setup', compact('user', 'QR_Image'));
    }

    /**
     * 启用两步验证
     */
    public function enable(Request $request)
    {
        $request->validate([
            'verify-code' => 'required|string',
        ], [
            'verify-code.required' => '请输入验证码',
        ]);

        $user = Auth::guard('admin')->user();
        $google2fa = app('pragmarx.google2fa');

        // 验证输入的验证码
        $valid = $google2fa->verifyKey($user->google2fa_secret, $request->input('verify-code'));

        if ($valid) {
            $user->google2fa_enabled = true;
            $user->save();

            return redirect()->route('admin.2fa.show')->with('success', '两步验证已启用');
        } else {
            return redirect()->route('admin.2fa.show')->with('error', '验证码错误，请重试');
        }
    }

    /**
     * 禁用两步验证
     */
    public function disable()
    {
        $user = Auth::guard('admin')->user();
        $user->google2fa_enabled = false;
        $user->google2fa_secret = null;
        $user->save();

        return redirect()->route('admin.2fa.show')->with('success', '两步验证已禁用');
    }
}
