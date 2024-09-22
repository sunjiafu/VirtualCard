@extends('user.layouts.master')

@section('breadcrumb')
    @include('user.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("Dashboard"),
            'url'   => setRoute("user.dashboard"),
        ]
    ], 'active' => __("Dashboard")])
@endsection

@section('content')
<div class="body-wrapper ">
    <div class="dashboard-area mt-10">
        <div class="dashboard-header-wrapper">
            <h3 class="title">{{ __("Welcome Back") }}, <span>{{ @$user->username }}</span></h3>
        </div>
        <div class="dashboard-item-area">
            <div class="row mb-20-none">
                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-6 mb-20">
                    <div class="dashbord-item">
                        <div class="dashboard-content">
                            <span class="sub-title">{{__("Current Balance")}}</span>
                            <h4 class="title text-light	">{{ @$baseCurrency->symbol }}{{ authWalletBalance() }}</h4>
                        </div>
                        <div class="dashboard-icon">
                            <i class="las la-dollar-sign"></i>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-6 mb-20">
                    <div class="dashbord-item">
                        <div class="dashboard-content">
                            <span class="sub-title">{{ __("Total Add Money") }}</span>
                            <h4 class="title text-light	">{{ @$baseCurrency->symbol }}{{ getAmount(@$totalAddMoney,2) }}</h4>
                        </div>
                        <div class="dashboard-icon">
                            <i class="menu-icon las la-cloud-upload-alt"></i>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-6 mb-20">
                    <div class="dashbord-item">
                        <div class="dashboard-content">
                            <span class="sub-title">{{ __("Active Tickets") }}</span>
                            <h4 class="title">{{ @$active_tickets }}</h4>
                        </div>
                        <div class="dashboard-icon">
                            <i class="menu-icon las la-recycle"></i>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-3 col-xl-4 col-lg-4 col-md-6 col-sm-6 mb-20">
                    <div class="dashbord-item">
                        <div class="dashboard-content">
                            <span class="sub-title">{{ __("Active Card") }}</span>
                            <h4 class="title">{{ @$virtualCards }}</h4>
                        </div>
                        <div class="dashboard-icon">
                            <i class="menu-icon fas fa-credit-card"></i>
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
    </div>

    <!-- 专属客服 -->

    <div class="dashboard-item-area mt-40">
    <div class="dashboard-header-wrapper">
        <h4 class="title">{{ __("您的客户经理") }}</h4>
    </div>
    <div class="row mb-20-none">
    
    <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 mb-20 customer-service">
    <div class="dashbord-item">
        <div class="dashboard-content">
            <span class="sub-title">{{ __("微信客服") }}</span>
            <a href="javascript:;" class="btn--base weixin">
                <i class="fab fa-weixin"></i> {{ __("联系客服") }}
                <img class="qrcode" src="{{ asset('public/frontend/') }}/images/element/wechat_qr.jpg" alt="WeChat QR Code">
            </a>
        </div>
        <div class="dashboard-icon">
            <i class="fab fa-weixin"></i>
        </div>
    </div>
</div>

        <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 mb-20">
            <div class="dashbord-item">
                <div class="dashboard-content">
                    <span class="sub-title">{{ __("Telegram客服") }}</span>
                    <a href="https://t.me/larienasoft" class="btn--base">
                        <i class="fab fa-telegram"></i> {{ __("联系客服") }}
                    </a>
                </div>
                <div class="dashboard-icon">
                    <i class="fab fa-telegram"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 客服结束 -->
    <div class="dashboard-list-area mt-60">
        <div class="dashboard-header-wrapper">
            <h4 class="title">{{ __("Latest Transactions") }}</h4>
            <div class="dashboard-btn-wrapper">
                <div class="dashboard-btn">
                    <a href="{{ setRoute('user.transactions.index','add-money') }}" class="btn--base">{{__("View More")}}</a>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard-list-wrapper">
        @include('user.components.transaction-log',compact("transactions"))
    </div>

</div>


@endsection

