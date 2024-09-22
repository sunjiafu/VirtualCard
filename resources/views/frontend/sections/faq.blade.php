@php
    $lang = selectedLang();
    // $feature_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::OUR_FEATURE);
    // $feature = App\Models\Admin\SiteSections::getData( $feature_slug)->first();
@endphp

<!-- ====== FAQ Start ====== -->
<section id="faq" class="ud-faq">
    <div class="shape">
        <img src="{{asset('public/frontend/images/faq/shape.svg')}}" alt="shape" />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="ud-section-title text-center mx-auto">
                    <span>{{__("FAQ")}}</span>
                    <h2>VelixiPay虚拟卡常见问题</h2>
                   
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="ud-single-faq wow fadeInUp" data-wow-delay=".1s">
                    <div class="accordion">
                        <button class="ud-faq-btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                            <span class="icon flex-shrink-0">
                                <i class="lni lni-chevron-down"></i>
                            </span>
                            <span>{{ __('如何注册VelixPay账户?') }}</span>
                        </button>
                        <div id="collapseOne" class="accordion-collapse collapse">
                            <div class="ud-faq-body">
                                你可以在VelixPay官网注册按钮或点击这里<a href="#">注册账户</a>通过邮箱注册
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ud-single-faq wow fadeInUp" data-wow-delay=".15s">
                    <div class="accordion">
                        <button class="ud-faq-btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                            <span class="icon flex-shrink-0">
                                <i class="lni lni-chevron-down"></i>
                            </span>
                            <span>{{ __('申请VelixPay信用卡是否需要实名认证') }}</span>
                        </button>
                        <div id="collapseTwo" class="accordion-collapse collapse">
                            <div class="ud-faq-body">
                                不需要实名认证，只需要验证您的邮箱即可申请VelixPay信用卡
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ud-single-faq wow fadeInUp" data-wow-delay=".2s">
                    <div class="accordion">
                        <button class="ud-faq-btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                            <span class="icon flex-shrink-0">
                                <i class="lni lni-chevron-down"></i>
                            </span>
                            <span>{{__('VelixPay虚拟信用卡可以用于哪些场景?')}}</span>
                        </button>
                        <div id="collapseThree" class="accordion-collapse collapse">
                            <div class="ud-faq-body">
                                可用于广告平台如FaceBook、GoogleAds、Tiktok ADS等广告费用支付，电商购物、游戏储值、会员订阅等可以使用信用卡的消费平台
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="ud-single-faq wow fadeInUp" data-wow-delay=".1s">
                    <div class="accordion">
                        <button class="ud-faq-btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour">
                            <span class="icon flex-shrink-0">
                                <i class="lni lni-chevron-down"></i>
                            </span>
                            <span>{{__('VelixPay都支持那些充值方式?')}}</span>
                        </button>
                        <div id="collapseFour" class="accordion-collapse collapse">
                            <div class="ud-faq-body">
                               VelixPay充值方式灵活，支持多种平台支付，USDT支付、支付宝支付均可进行充值，还可以通过客服进行充值
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ud-single-faq wow fadeInUp" data-wow-delay=".15s">
                    <div class="accordion">
                        <button class="ud-faq-btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFive">
                            <span class="icon flex-shrink-0">
                                <i class="lni lni-chevron-down"></i>
                            </span>
                            <span>{{__('VelixPay平台余额用不完是否可以提现?')}}</span>
                        </button>
                        <div id="collapseFive" class="accordion-collapse collapse">
                            <div class="ud-faq-body">
                                可以提现！如果您在VelixPay的余额不再继续使用，可以申请提现，可以提现到您的支付宝或USDT账户。
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ud-single-faq wow fadeInUp" data-wow-delay=".2s">
                    <div class="accordion">
                        <button class="ud-faq-btn collapsed" data-bs-toggle="collapse" data-bs-target="#collapseSix">
                            <span class="icon flex-shrink-0">
                                <i class="lni lni-chevron-down"></i>
                            </span>
                            <span>申请虚拟信用卡需要多长时间？</span>
                        </button>
                        <div id="collapseSix" class="accordion-collapse collapse">
                            <div class="ud-faq-body">
                                您只需要几分钟时间即可拥有VelixPay虚拟卡

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
