@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("Dashboard"),
            'url'   => setRoute("user.dashboard"),
        ]
    ], 'active' => __("Add Money")])
@endsection

@section('content')
<div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
    <div class="container-fluid px-0">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h2 mb-0">{{ __("Add Money") }}</h1>
            </div>
        </div>
    </div>
</div>

<div class="p-3 p-xxl-5">
    <div class="container-fluid px-0">
        <div class="row g-4">
            <div class="col-lg-6">
                <div class="card rounded-12 shadow-dark-80 h-100">
                    <div class="card-body p-4 d-flex flex-column">
                        <h5 class="card-title mb-4">{{ __($page_title) }}</h5>
                        <form class="row g-4 flex-grow-1" action="{{ setRoute("user.add.money.submit") }}" method="POST" novalidate>
                            @csrf
                            <div class="col-md-12">
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
                            </div>
                            <div class="col-md-12">
                                <label class="form-label">{{ __("输入金额") }}<span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="number" class="form-control" placeholder="{{ __("输入金额") }}" name="amount" value="{{ old("amount") }}" required>
                                    <span class="input-group-text">{{ get_default_currency_code() }}</span>
                                </div>
                            </div>
                            <div class="col-12 d-flex justify-content-between">
                                <small class="text-muted limit-show">--</small>
                                <small class="text-muted fees-show">--</small>
                            </div>
                            <div class="col-12 mt-auto">
                                <button type="submit" class="btn btn-primary w-100">{{ __("确认") }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card rounded-12 shadow-dark-80 h-100">
                    <div class="card-body p-4 d-flex flex-column">
                        <h5 class="card-title mb-4">{{ __($page_title) }} {{ __("预览") }}</h5>
                        <ul class="list-group list-group-flush flex-grow-1">
                            <li class="list-group-item d-flex justify-content-between align-items-center py-3">
                                {{ __("输入金额") }}
                                <span class="request-amount">--</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center py-3">
                                {{ __("Exchange Rate") }}
                                <span class="rate-show">--</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center py-3">
                                {{__("Fees & Charges")}}
                                <span class="fees">--</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center py-3">
                                {{__("Conversion Amount")}}
                                <span class="conversionAmount">--</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center py-3">
                                {{__("Will Get")}}
                                <span class="will-get">--</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center py-3">
                                {{ __("Total Payable Amount") }}
                                <span class="pay-in-total">--</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-12">
                <div class="card rounded-12 shadow-dark-80">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="card-title mb-0">{{ __("充值记录") }}</h5>
                            <a href="{{ setRoute('user.transactions.index', 'add-money') }}" class="btn btn-sm btn-primary">{{__("查看更多")}}</a>
                        </div>
                        @include('user.components.transaction-log', compact("transactions"))
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('user.partials.footer')
</div>
@endsection

@push('script')
<script>
    $(document).ready(function() {
        var defualCurrency = "{{ get_default_currency_code() }}";
        var defualCurrencyRate = "{{ get_default_currency_rate() }}";
        var precision = 4;

        function acceptVar() {
            var selectedVal = $("select[name=currency] :selected");
            return {
                currencyCode: selectedVal.data('currency'),
                currencyRate: selectedVal.data('rate'),
                cryptoType: selectedVal.data('crypto'),
                currencyMinAmount: selectedVal.data('min_amount'),
                currencyMaxAmount: selectedVal.data('max_amount'),
                currencyFixedCharge: selectedVal.data('fixed_charge'),
                currencyPercentCharge: selectedVal.data('percent_charge'),
                selectedVal: selectedVal,
            };
        }

        function updateAll() {
            var vars = acceptVar();
            precision = vars.cryptoType == 1 ? 8 : 4;
            getExchangeRate();
            getLimit();
            getFees();
            getPreview();
        }

        $('select[name=currency]').on('change', updateAll);
        $("input[name=amount]").on('input', function() {
            getFees();
            getPreview();
        }).on('blur', enterLimit);

        function getExchangeRate() {
            var vars = acceptVar();
            $('.rate-show').text("1 " + defualCurrency + " = " + parseFloat(vars.currencyRate).toFixed(precision) + " " + vars.currencyCode);
        }

        function getLimit() {
            var vars = acceptVar();
            if ($.isNumeric(vars.currencyMinAmount) && $.isNumeric(vars.currencyMaxAmount)) {
                var minLimit = parseFloat(vars.currencyMinAmount / vars.currencyRate).toFixed(4);
                var maxLimit = parseFloat(vars.currencyMaxAmount / vars.currencyRate).toFixed(4);
                $('.limit-show').text("{{ __('Limit') }} " + minLimit + " " + defualCurrency + " - " + maxLimit + " " + defualCurrency);
                return { minLimit: minLimit, maxLimit: maxLimit };
            } else {
                $('.limit-show').text("--");
                return { minLimit: 0, maxLimit: 0 };
            }
        }

        function enterLimit() {
            var vars = acceptVar();
            var limits = getLimit();
            var amount = parseFloat($("input[name=amount]").val());

            if (amount < limits.minLimit) {
                throwMessage('error', ["{{ __('Please follow the minimum limit') }}"]);
                $('.sendBtn').prop('disabled', true);
            } else if (amount > limits.maxLimit) {
                throwMessage('error', ["{{ __('Please follow the maximum limit') }}"]);
                $('.sendBtn').prop('disabled', true);
            } else {
                $('.sendBtn').prop('disabled', false);
            }
        }

        function feesCalculation() {
            var vars = acceptVar();
            var amount = parseFloat($("input[name=amount]").val()) || 0;

            if ($.isNumeric(vars.currencyPercentCharge) && $.isNumeric(vars.currencyFixedCharge) && $.isNumeric(amount)) {
                var fixedCharge = parseFloat(vars.currencyRate * vars.currencyFixedCharge);
                var percentCharge = parseFloat(vars.currencyRate) * (amount / 100) * parseFloat(vars.currencyPercentCharge);
                var totalCharge = (fixedCharge + percentCharge).toFixed(precision);
                return {
                    total: totalCharge,
                    fixed: fixedCharge,
                    percent: vars.currencyPercentCharge,
                };
            }
            return false;
        }

        function getFees() {
            var vars = acceptVar();
            var charges = feesCalculation();
            if (charges) {
                $(".fees-show").text("{{ __('Charge') }}: " + parseFloat(charges.fixed).toFixed(precision) + " " + vars.currencyCode + " + " + parseFloat(charges.percent).toFixed(precision) + "%");
            } else {
                $(".fees-show").text("--");
            }
        }

        function getPreview() {
            var vars = acceptVar();
            var amount = parseFloat($("input[name=amount]").val()) || 0;
            var charges = feesCalculation() || { total: 0 };

            $('.request-amount').text(amount.toFixed(precision) + " " + defualCurrency);
            $('.fees').text(charges.total + " " + vars.currencyCode);

            var conversionAmount = amount * vars.currencyRate;
            $('.conversionAmount').text(conversionAmount.toFixed(precision) + " " + vars.currencyCode);

            var willGet = amount.toFixed(4);
            $('.will-get').text(willGet + " " + defualCurrency);

            var payInTotal = (parseFloat(charges.total) + conversionAmount).toFixed(precision);
            $('.pay-in-total').text(payInTotal + " " + vars.currencyCode);
        }

        // 初始化
        updateAll();
    });
</script>
@endpush
