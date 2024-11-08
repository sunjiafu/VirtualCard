<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Constants\NotificationConst;
use App\Events\Admin\NotificationEvent;
use App\Http\Controllers\Controller;
use App\Models\Admin\AdminLoginLogs;
use App\Models\Admin\AdminNotification;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Jenssegers\Agent\Agent;
use Illuminate\Foundation\Auth\ThrottlesLogins;


class LoginController extends Controller
{
    use AuthenticatesUsers, ThrottlesLogins;

    /**
     * Display The Amdin Login From Page
     *
     * @return view
     */
    public function showLoginForm() {
        $user = null;
        return view('admin.auth.login',compact('user') );
    }



    /**
     * Validate the user login request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    protected function validateLogin(Request $request)
    {
        $rules = [
            'email'    => 'required|string',
            'password' => 'required|string',
            'captcha'  => 'required|captcha',
        ];

        $messages = [
            'email.required'    => '请输入邮箱',
            'password.required' => '请输入密码',
            'captcha.required'  => '请填写验证码',
            'captcha.captcha'   => '验证码错误，请重新输入',
        ];

        // 获取用户信息
        $user = \App\Models\Admin\Admin::where('email', $request->email)->first();

        // 如果用户启用了两步验证，则要求验证码
        if ($user && $user->google2fa_enabled) {
            $rules['google2fa_code'] = 'required|string';
            $messages['google2fa_code.required'] = '请输入谷歌验证码';
        }

        $request->validate($rules, $messages);
    }

    /**
     * Get The Authenticated User Guard
     * @return instance
     */
    protected function guard()
    {
        return Auth::guard('admin');
    }


    /**
     * The user has been authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function authenticated(Request $request, $user)
    {
        $this->createLoginLog($user);
        $this->updateInfo($user);
        return redirect()->intended(route('admin.dashboard'));
    }


    protected function createLoginLog($admin) {

        $client_ip = request()->ip() ?? false;
        $location = geoip()->getLocation($client_ip);

        $agent = new Agent();
        $mac = "";

        $data = [
            'admin_id'      => $admin->id,
            'ip'            => $client_ip,
            'mac'           => $mac,
            'city'          => $location['city'] ?? "",
            'country'       => $location['country'] ?? "",
            'longitude'     => $location['lon'] ?? "",
            'latitude'      => $location['lat'] ?? "",
            'timezone'      => $location['timezone'] ?? "",
            'browser'       => $agent->browser() ?? "",
            'os'            => $agent->platform() ?? "",
        ];

        try{
            AdminLoginLogs::create($data);
            $notification_message = [
                'title'   => $admin->fullname . "(" . $admin->username . ")" . " logged in.",
                'time'      => Carbon::now()->diffForHumans(),
                'image'     => get_image($admin->image,'admin-profile'),
            ];
            AdminNotification::create([
                'type'      => NotificationConst::SIDE_NAV,
                'admin_id'  => $admin->id,
                'message'   => $notification_message,
            ]);
            event(new NotificationEvent($notification_message));
        }catch(Exception $e) {
            // return false;
        }
    }


    /**
     * Get the failed login response instance.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            'credential' => [trans('auth.failed')],
        ]);
    }


    protected function updateInfo($admin) {
        try{
            $admin->update([
                'last_logged_in'    => now(),
                'login_status'      => true,
            ]);
        }catch(Exception $e) {
            // handle error
        }
    }


    /**
     * Get the needed authorization credentials from the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected function credentials(Request $request)
    {
        $request->merge(['status' => true]);
        return $request->only($this->username(), 'password','status');
    }

    protected function attemptLogin(Request $request)
    {
        $credentials = $this->credentials($request);
        $user = $this->guard()->getProvider()->retrieveByCredentials($credentials);

        if ($user) {
            // 如果用户启用了两步验证，验证谷歌验证码
            if ($user->google2fa_enabled) {
                $google2fa = app('pragmarx.google2fa');
                $valid = $google2fa->verifyKey($user->google2fa_secret, $request->google2fa_code);

                if (!$valid) {
                    throw ValidationException::withMessages([
                        'google2fa_code' => ['谷歌验证码不正确'],
                    ]);
                }
            }

            return $this->guard()->attempt(
                $this->credentials($request), $request->filled('remember')
            );
        }

        return false;
    }
}
