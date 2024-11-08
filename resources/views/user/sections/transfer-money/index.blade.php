@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb', [
        'breadcrumbs' => [
            [
                'name' => __("Dashboard"),
                'url' => setRoute("user.dashboard"),
            ],
            [
                'name' => __("Transfer Money"),
                'url' => '',
            ],
        ],
        'active' => __($page_title)
    ])
@endsection

@section('content')
<div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
    <div class="container-fluid px-0">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h2 mb-0">{{ __($page_title) }}</h1>
            </div>
        </div>
    </div>
</div>

<div class="p-3 p-xxl-5">
    <div class="container-fluid px-0">
        <div class="row">
            <!-- Transfer Money Form -->
            <div class="col-lg-6 mb-4">
                <div class="card rounded-12 shadow">
                    <div class="card-header">
                        <h5 class="card-title mb-0">{{ __($page_title) }}</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ setRoute('user.transfer.money.confirmed') }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="email" class="form-label">{{ __("Receiver Email") }}<span>*</span></label>
                                <input type="email" class="form-control checkUser" id="email" name="email" placeholder="{{ __("Receiver Email") }}" value="{{ old('email') }}" required>
                                <div class="form-text text-start exist"></div>
                            </div>
                            <div class="mb-3">
                                <label for="amount" class="form-label">{{ __("Enter Amount") }}<span>*</span></label>
                                <div class="input-group">
                                    <input type="number" class="form-control" id="amount" name="amount" placeholder="{{ __("Enter Amount") }}" value="{{ old('amount') }}" required>
                                    <span class="input-group-text">{{ get_default_currency_code() }}</span>
                                </div>
                                <div class="text-end mt-2">
                                    <small class="text-muted balance-show">{{ __("Available Balance") }}: {{ authWalletBalance() }} {{ get_default_currency_code() }}</small>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <div class="limit-show">--</div>
                                <div class="fees-show">--</div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 transferBtn">{{ __("Confirm") }}</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Transfer Preview -->
            <div class="col-lg-6 mb-4">
                <div class="card rounded-12 shadow">
                    <div class="card-header">
                        <h5 class="card-title mb-0">{{ __($page_title) }} {{ __("Preview") }}</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3 d-flex justify-content-between">
                            <span>{{ __("Enter Amount") }}</span>
                            <span class="request-amount">--</span>
                        </div>
                        <div class="mb-3 d-flex justify-content-between">
                            <span>{{ __("Transfer Fee") }}</span>
                            <span class="fees">--</span>
                        </div>
                        <div class="mb-3 d-flex justify-content-between">
                            <span>{{ __("Recipient Receives") }}</span>
                            <span class="recipient-get">--</span>
                        </div>
                        <div class="mb-3 d-flex justify-content-between">
                            <span>{{ __("Total Payable Amount") }}</span>
                            <span class="payable-total">--</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Transfer Money Log -->
        <div class="row">
            <div class="col-12">
                <div class="card rounded-12 shadow">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">{{ __("Transfer Money Log") }}</h5>
                        <a href="{{ setRoute('user.transactions.index', 'transfer-money') }}" class="btn btn-link">{{ __("View More") }}</a>
                    </div>
                    <div class="card-body">
                        @include('user.components.transaction-log', compact('transactions'))
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    $(document).ready(function() {
        // 检查用户是否存在
        $('.checkUser').on('keyup', function() {
            var url = '{{ route('user.transfer.money.check.exist') }}';
            var value = $(this).val();
            var token = '{{ csrf_token() }}';
            var data = { email: value, _token: token };

            $.post(url, data, function(response) {
                var existLabel = $('.exist');
                if(response.own){
                    existLabel.removeClass('text-success').addClass('text-danger').text(response.own);
                    $('.transferBtn').attr('disabled', true);
                } else if(response.data != null){
                    existLabel.removeClass('text-danger').addClass('text-success').text('{{ __("有效账户") }}');
                    $('.transferBtn').attr('disabled', false);
                } else {
                    existLabel.removeClass('text-success').addClass('text-danger').text('{{ __("User doesn't exist.") }}');
                    $('.transferBtn').attr('disabled', true);
                }
            });
        });

        // 初始化函数
        getLimit();
        getFees();
        getPreview();

        // 当金额变化时更新费用和预览
        $('input[name=amount]').on('keyup', function() {
            getFees();
            getPreview();
        });

        $('input[name=amount]').on('focusout', function() {
            enterLimit();
        });

        // 函数定义
        function acceptVar() {
            return {
                currencyCode: "{{ get_default_currency_code() }}",
                currencyRate: parseFloat("{{ get_default_currency_rate() }}"),
                currencyMinAmount: parseFloat("{{ getAmount($transferMoneyCharge->min_limit) }}"),
                currencyMaxAmount: parseFloat("{{ getAmount($transferMoneyCharge->max_limit) }}"),
                currencyFixedCharge: parseFloat("{{ getAmount($transferMoneyCharge->fixed_charge) }}"),
                currencyPercentCharge: parseFloat("{{ getAmount($transferMoneyCharge->percent_charge) }}"),
            };
        }

        function getLimit() {
            var vars = acceptVar();
            var min_limit = vars.currencyMinAmount;
            var max_limit = vars.currencyMaxAmount;
            var currencyCode = vars.currencyCode;
            if($.isNumeric(min_limit) && $.isNumeric(max_limit)) {
                $('.limit-show').html("{{ __('Limit') }}: " + min_limit.toFixed(2) + " " + currencyCode + " - " + max_limit.toFixed(2) + " " + currencyCode);
            } else {
                $('.limit-show').html("--");
            }
        }

        function feesCalculation() {
            var vars = acceptVar();
            var senderAmount = parseFloat($("input[name=amount]").val()) || 0;
            var fixedCharge = vars.currencyFixedCharge;
            var percentCharge = vars.currencyPercentCharge;
            var totalCharge = fixedCharge + (senderAmount * (percentCharge / 100));
            return {
                total: totalCharge.toFixed(2),
                fixed: fixedCharge.toFixed(2),
                percent: percentCharge.toFixed(2),
            };
        }

        function getFees() {
            var charges = feesCalculation();
            var currencyCode = acceptVar().currencyCode;
            $(".fees-show").html("{{ __('Transfer Fee') }}: " + charges.fixed + " " + currencyCode + " + " + charges.percent + "%");
        }

        function getPreview() {
            var senderAmount = parseFloat($("input[name=amount]").val()) || 0;
            var vars = acceptVar();
            var currencyCode = vars.currencyCode;

            // 发送金额
            $('.request-amount').text(senderAmount.toFixed(2) + " " + currencyCode);

            // 费用
            var charges = feesCalculation();
            $('.fees').text(charges.total + " " + currencyCode);

            // 接收者收到
            var recipientGet = senderAmount;
            $('.recipient-get').text(recipientGet.toFixed(2) + " " + currencyCode);

            // 总支付金额
            var totalPayable = senderAmount + parseFloat(charges.total);
            $('.payable-total').text(totalPayable.toFixed(2) + " " + currencyCode);
        }

        function enterLimit(){
            var vars = acceptVar();
            var min_limit = vars.currencyMinAmount;
            var max_limit = vars.currencyMaxAmount;
            var senderAmount = parseFloat($("input[name=amount]").val()) || 0;
            if(senderAmount < min_limit){
                alert('{{ __("Please follow the minimum limit") }}');
                $('.transferBtn').attr('disabled', true);
            } else if(senderAmount > max_limit){
                alert('{{ __("Please follow the maximum limit") }}');
                $('.transferBtn').attr('disabled', true);
            } else {
                $('.transferBtn').attr('disabled', false);
            }
        }
    });
</script>
@endpush
