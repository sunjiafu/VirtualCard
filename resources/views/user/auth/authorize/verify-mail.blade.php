@extends('frontend.layouts.master_muban')
@section('content')

   {{-- Banner Start --}}

   <section class="ud-page-banner">
    <div class="container-up">
        <div class="row">
            <div class="col-lg-12">
                <div class="ud-banner-content">
                    <h1>Email Verification</h1>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="verification-otp ptb-60">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-8 col-md-10 col-sm-12">
                <div class="verification-otp-area">
                    <div class="account-wrapper otp-verification text-center">
                        <div class="account-logo mb-5">
                            <a class="site-logo" href="{{ setRoute('index') }}">
                                <img src="{{ get_logo($basic_settings) }}" data-white_img="{{ get_logo($basic_settings,'white') }}"
                                    data-dark_img="{{ get_logo($basic_settings,'dark') }}" alt="site-logo">
                            </a>
                        </div>

                        <div class="verification-otp-content ptb-30">
                            <h3 class="title mb-3">{{ __("验证您的帐户") }}</h3>
                            <p class="text-muted mb-4">{{ __("请检查您的邮箱，输入我们发送给您的代码") }}</p>
                        </div>

                        <!-- 验证表单 -->
                        <form action="{{ setRoute('user.authorize.mail.verify',$token) }}" class="account-form" method="POST">
                            @csrf
                            <div class="row justify-content-center">
                                <div class="col-lg-12 form-group d-flex justify-content-between mb-4">
                                    <!-- 优化验证码输入框 -->
                                    @for ($i = 1; $i <= 6; $i++)
                                    <input class="otp text-center mx-1" name="code[]" type="text" oninput='digitValidate(this)' onkeyup='tabChange({{ $i }})'
                                        maxlength=1 required style="width: 50px; font-size: 24px; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
                                    @endfor
                                    @error("code")
                                    <span class="invalid-feedback d-block" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="col-lg-12 text-center">
                                    <div class="time-area text-muted">{{ __("You can resend the code after") }} <span id="time"></span></div>
                                </div>
                                <div class="col-lg-12 text-center mt-4">
                                    <button type="submit" class="btn btn-primary w-100 btn-loading">{{ __("验证") }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@push('script')
<script>
    let digitValidate = function (ele) {
        ele.value = ele.value.replace(/[^0-9]/g, '');
    }

    let tabChange = function (val) {
        let ele = document.querySelectorAll('.otp');
        if (ele[val - 1].value != '') {
            if (val < 6) ele[val].focus(); // 移动到下一个输入框
        } else if (ele[val - 1].value == '') {
            if (val > 1) ele[val - 2].focus(); // 回到前一个输入框
        }
    }
</script>

<script>
    var convertAsSecond = "{{ global_const()::USER_VERIFY_RESEND_TIME_MINUTE }}" * 60;

    function resetTime(second = convertAsSecond) {
        var countdownSec = second;
        var countDownDate = new Date();
        countDownDate.setMinutes(countDownDate.getMinutes() + 120);

        var x = setInterval(function () {
            var now = new Date().getTime();
            var distance = countDownDate - now;
            var minutes = Math.floor((distance % (1000 * countdownSec)) / (1000 * countdownSec));
            var seconds = Math.floor((distance % (1000 * countdownSec)) / 1000);

            document.getElementById("time").innerHTML = seconds + "s ";

            if (distance < 0 || second < 2) {
                clearInterval(x);
                document.querySelector(".time-area").innerHTML = "Didn't get the code? <a href='{{ setRoute('user.authorize.resend.code') }}' class='text-danger'>Resend</a>";
            }

            second--;
        }, 1000);
    }

    resetTime();
</script>

<script>
    $(".otp").parents("form").find("input[type=submit],button[type=submit]").click(function (e) {
        var otps = $(this).parents("form").find(".otp");
        var result = true;
        $.each(otps, function (index, item) {
            if ($(item).val() == "" || $(item).val() == null) {
                result = false;
            }
        });

        if (result == false) {
            $(this).parents("form").find(".otp").addClass("required");
        } else {
            $(this).parents("form").find(".otp").removeClass("required");
            $(this).parents("form").submit();
        }
    });
</script>
@endpush
