@extends('user.layouts.maste-new')


@section('breadcrumb')
@include('user.components.breadcrumb', [
    'breadcrumbs' => [
        [
            'name' => __("Dashboard"),
            'url' => setRoute("user.dashboard"),
        ]
    ],
    'active' => __(@$page_title)
])
@endsection

@section('content')
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title mb-4">{{ __($page_title) }}</h5>
                    <form class="row g-3 needs-validation" action="{{ setRoute("user.add.money.submit") }}" method="POST" novalidate>
                        @csrf
                        <div class="col-md-6 mb-3">
                            <label class="form-label">{{ __("支付网关") }}<span class="text-danger">*</span></label>
                            <select class="form-select" name="currency" required>
                                <option selected disabled value="">{{ __("选择支付网关") }}</option>
                                @foreach ($payment_gateways_currencies ?? [] as $item)
                                    <option value="{{ $item->alias }}"
                                        data-currency="{{ $item->currency_code }}"
                                        data-min_amount="{{ $item->min_limit }}"
                                        data-max_amount="{{ $item->max_limit }}"
                                        data-percent_charge="{{ $item->percent_charge }}"
                                        data-fixed_charge="{{ $item->fixed_charge }}"
                                        data-rate="{{ $item->rate }}"
                                        data-crypto="{{ $item->gateway->crypto }}">
                                        {{ $item->alias === 'add-money-epusdt-usd-automatic' ? 'Usdt-Trc20' : $item->name }}
                                    </option>
                                @endforeach
                            </select>
                            <div class="invalid-feedback">
                                {{ __("请选择一个支付网关") }}
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">{{ __("输入金额") }}<span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="number" class="form-control" placeholder="{{ __("输入金额") }}" name="amount" value="{{ old("amount") }}" required>
                                <span class="input-group-text">{{ get_default_currency_code() }}</span>
                                <div class="invalid-feedback">
                                    {{ __("请输入有效金额") }}
                                </div>
                            </div>
                        </div>
                        <div class="col-12 d-flex justify-content-between mb-3">
                            <small class="text-muted limit-show">--</small>
                            <small class="text-muted fees-show">--</small>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary w-100">{{ __("确认") }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <h5 class="card-title mb-4">{{ __($page_title) }} {{ __("预览") }}</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            {{ __("输入金额") }}
                            <span class="request-amount"></span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            {{ __("Exchange Rate") }}
                            <span class="rate-show">--</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            {{__("Fees & Charges")}}
                            <span class="fees">--</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            {{__("Conversion Amount")}}
                            <span class="conversionAmount">--</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            {{__("Will Get")}}
                            <span class="will-get">--</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            {{ __("Total Payable Amount") }}
                            <span class="pay-in-total">--</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <div class="card shadow-sm border-0 mt-4">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="card-title mb-0">{{ __("充值记录") }}</h5>
                <a href="{{ setRoute('user.transactions.index', 'add-money') }}" class="btn btn-sm btn-primary">{{__("查看更多")}}</a>
            </div>
            @include('user.components.transaction-log', compact("transactions"))
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
// 保持原有的JavaScript代码不变
// ...
</script>
@endpush
