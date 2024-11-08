@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb', [
        'breadcrumbs' => [
            [
                'name' => __("Dashboard"),
                'url' => route("user.dashboard"),
            ],
            [
                'name' => __("申请卡片"),
                'url' => '',
            ],
        ],
        'active' => __("申请卡片")
    ])
@endsection

@section('content')
    <!-- 页面标题 -->
    <div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
        <div class="container-fluid px-0">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="h2 mb-0">申请卡片</h1>
                </div>
            </div>
        </div>
    </div>

    <!-- 卡片列表 -->
    <div class="p-3 p-xxl-5">
        <div class="container-fluid px-0">
            <div class="card rounded-12 shadow-dark-80">
                <div class="card-body p-4">
                    <div class="table-responsive">
                        <table class="table card-table table-nowrap overflow-hidden">
                            <thead>
                                <tr>
                                    <th>地区</th>
                                    <th>卡片类型</th>
                                    <th>卡段</th>
                                    <th>币种</th>
                                    <th>说明</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                @isset($virtualCardBins)
                                    @forelse ($virtualCardBins as $bin)
                                        <tr>
                                            <td>{{ $bin->region }}</td>
                                            <td>{{ $bin->card_type }}</td>
                                            <td>{{ $bin->bin }}</td>
                                            <td>{{ $bin->currency }}</td>
                                            <td>{{ $bin->description }}</td>
                                            <td>
                                                <a href="javascript:void(0);"
                                                   class="btn btn-primary apply-card-btn px-4 py-2"
                                                   data-bin-id="{{ $bin->id }}"
                                                   data-card-bin="{{ $bin->bin }}"
                                                   data-card-type="{{ $bin->card_type }}"
                                                   data-currency="{{ $bin->currency }}"
                                                   data-fixed-charge="{{ getAmount($cardCharge->fixed_charge) }}"
                                                   data-percent-charge="{{ getAmount($cardCharge->percent_charge) }}"
                                                   data-min-limit="{{ getAmount($cardCharge->min_limit) }}"
                                                   data-max-limit="{{ getAmount($cardCharge->max_limit) }}"
                                                   data-wallet-balance="{{ authWalletBalance() }}"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#applyCardModal">
                                                    <i class="fas fa-plus me-2"></i>申请
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-center">{{ __("没有找到卡片记录") }}</td>
                                        </tr>
                                    @endforelse
                                @endisset
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center mt-4">
                        {{ $virtualCardBins->links() }}
                    </div>
                </div>
            </div>
        </div>
        @include('user.partials.footer')
    </div>

    <!-- 申请卡片模态 -->
    <div class="modal fade" id="applyCardModal" tabindex="-1" aria-labelledby="applyCardModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content shadow-dark-80">
                <!-- 添加关闭按钮 -->
                <div class="modal-header border-0 pb-0 pt-3 align-items-start">
                    <div>
                        <h5 class="modal-title" id="applyCardModalLabel">申请新卡片</h5>
                        <p class="mb-0 text-muted">填写信息以申请新的虚拟卡片</p>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body pt-2">
                    <form id="applyCardForm" action="{{ route('user.virtual.card.create') }}" method="POST">
                        @csrf
                        <div class="row g-2">
                            <!-- 卡片预览 - 减少底部间距 -->
                            <div class="col-12 text-center">
                                <div class="card-custom-area mb-2">
                                    <div class="card-wrapper">
                                        <div class="card-custom" style="position: relative; width: 350px; height: 220px; border-radius: 15px; background: linear-gradient(135deg, #0d47a1, #1976d2); color: #fff; padding: 20px; margin: 0 auto;">
                                            <div class="card-logo" style="position: absolute; top: 20px; left: 20px;">
                                                <img class="logo" src="{{ get_fav($basic_settings) }}" alt="site-logo" style="width: 40px;">
                                            </div>
                                            <div class="card-number" style="position: absolute; top: 80px; left: 20px; font-size: 1.3rem; letter-spacing: 2px; font-weight: bold;">
                                                0000 0000 0000 0000
                                            </div>
                                            <div class="card-holder" style="position: absolute; bottom: 50px; left: 20px; font-size: 0.9rem;">
                                                {{ auth()->user()->fullname }}
                                            </div>
                                            <div class="valid-thru" style="position: absolute; bottom: 20px; left: 20px; font-size: 0.8rem;">
                                                00/00
                                            </div>
                                            <div class="card-cvv" style="position: absolute; bottom: 20px; right: 20px; font-size: 0.8rem;">
                                                CVV: 000
                                            </div>
                                            <div class="card-type" style="position: absolute; top: 20px; right: 20px;">
                                                <img id="cardBrandLogo" src="{{ asset('public/frontend/images/logo/visa.svg') }}" alt="Card Brand" style="width: 50px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 卡片信息展示 - 减少上下间距 -->
                            <div class="col-12">
                                <div class="card mb-2">
                                    <div class="card-body py-2">
                                        <ul class="list-unstyled mb-0">
                                            <li class="mb-2">
                                                <strong>卡片类型：</strong>
                                                <span id="displayCardType"></span>
                                                <input type="hidden" id="cardType" name="card_type">
                                            </li>
                                            <li class="mb-2">
                                                <strong>卡段：</strong>
                                                <span id="displayCardBin"></span>
                                                <input type="hidden" id="cardBin" name="card_bin">
                                            </li>
                                            <li>
                                                <strong>币种：</strong>
                                                <span id="displayCurrency"></span>
                                                <input type="hidden" id="currency" name="currency">
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- 调整卡片金额标签和输入框的间距 -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="mb-2">卡片金额<span>*</span></label>
                                    <input type="number" class="form-control form-control-lg mb-2" id="cardAmount" name="card_amount" placeholder="请输入金额" required>
                                    <div class="d-flex justify-content-between mt-2">
                                        <small class="text-muted" id="limitShow">--</small>
                                        <small class="text-muted">余额：{{ authWalletBalance() }} {{ get_default_currency_code() }}</small>
                                    </div>
                                </div>
                            </div>

                            <!-- 费用显示 -->
                            <div class="col-12">
                                <div class="card mb-2">
                                    <div class="card-body py-2">
                                        <div class="d-flex justify-content-between">
                                            <h6 class="mb-0">总费用：</h6>
                                            <h6 class="mb-0" id="feesShow">--</h6>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="mb-0">总支付：</h6>
                                            <h6 class="mb-0" id="payableTotal">--</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 提交按钮 - 减少上方间距 -->
                            <div class="col-12 mt-2">
                                <button type="submit" class="btn btn-primary w-100">确认申请</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
        </div>
        
    </div>
    
@endsection

@push('script')
<script>
    $(document).ready(function() {
        let defaultCurrency = "{{ get_default_currency_code() }}";
        let defaultCurrencyRate = parseFloat("{{ get_default_currency_rate() }}");

        $('.apply-card-btn').on('click', function() {
            let modal = $('#applyCardModal');

            // 获取卡片信息
            let cardType = $(this).data('card-type');
            let cardBin = $(this).data('card-bin');
            let currency = $(this).data('currency');
            let fixedCharge = parseFloat($(this).data('fixed-charge'));
            let percentCharge = parseFloat($(this).data('percent-charge'));
            let minLimit = parseFloat($(this).data('min-limit'));
            let maxLimit = parseFloat($(this).data('max-limit'));
            let walletBalance = parseFloat($(this).data('wallet-balance'));

            // 填充隐藏的输入框
            modal.find('#cardType').val(cardType);
            modal.find('#cardBin').val(cardBin);
            modal.find('#currency').val(currency);

            // 显示卡片信息
            modal.find('#displayCardType').text(cardType.toUpperCase());
            modal.find('#displayCardBin').text(cardBin);
            modal.find('#displayCurrency').text(currency);

            // 更新卡片品牌图标
            let cardBrandLogo = '';
            if (cardType.toLowerCase() === 'visa') {
                cardBrandLogo = '{{ asset("public/frontend/images/logo/visa.svg") }}';
            } else if (cardType.toLowerCase() === 'mastercard') {
                cardBrandLogo = '{{ asset("public/frontend/images/logo/mastercard.svg") }}';
            } else {
                cardBrandLogo = '';
            }
            modal.find('#cardBrandLogo').attr('src', cardBrandLogo);

            // 显示限额
            let minLimitCalc = (minLimit / defaultCurrencyRate).toFixed(2);
            let maxLimitCalc = (maxLimit / defaultCurrencyRate).toFixed(2);
            modal.find('#limitShow').text("限额：" + minLimitCalc + " - " + maxLimitCalc + " " + defaultCurrency);

            // 费用计算函数
            function calculateFees() {
                let amount = parseFloat(modal.find('#cardAmount').val());
                if (isNaN(amount) || amount <= 0) {
                    modal.find('#feesShow').text("--");
                    modal.find('#payableTotal').text("--");
                    return;
                }

                // 检查限额
                if (amount < minLimitCalc || amount > maxLimitCalc) {
                    modal.find('#feesShow').text("超出限额");
                    modal.find('#payableTotal').text("--");
                    return;
                }

                // 费用计算
                let fixedChargeCalc = fixedCharge * defaultCurrencyRate;
                let percentChargeCalc = (amount * percentCharge) / 100;
                let totalCharge = fixedChargeCalc + percentChargeCalc;
                totalCharge = totalCharge.toFixed(2);

                let totalPayable = parseFloat(amount) + parseFloat(totalCharge);
                totalPayable = totalPayable.toFixed(2);

                modal.find('#feesShow').text(fixedChargeCalc.toFixed(2) + " " + defaultCurrency + " + " + percentCharge + "% = " + totalCharge + " " + defaultCurrency);
                modal.find('#payableTotal').text(totalPayable + " " + defaultCurrency);
            }

            // 当金额输入变化时，重新计算费用
            modal.find('#cardAmount').off('input').on('input', function() {
                calculateFees();
            });

            // 初始化费用显示
            calculateFees();
        });
    });
</script>
@endpush
