<!-- Card Details Page Redesign -->
@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("仪表盘"),
            'url'   => setRoute("user.dashboard"),
        ],
        [
            'name' => __("虚拟信用卡"),
            'url' => setRoute("user.virtual.card.index"),
        ],
        [
            'name' => __("卡片详情"),
            'url' => '#',
        ],
    ], 'active' => __("卡片详情")])
@endsection

@section('content')
    <div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
        <div class="container-fluid px-0">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="h2 mb-0">量子卡详情</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="p-3 p-xxl-5">
        <div class="container-fluid px-0">
            <div class="row">
                <!-- 左侧银行卡 -->
                <div class="col-md-4 mb-4">
                    <div class="card rounded-12 shadow h-100">
                        <div class="card-body text-center">
                            <div class="card-custom-area">
                                <div class="card-wrapper">
                                    <div class="card-custom" style="position: relative; width: 350px; height: 220px; border-radius: 15px; background: linear-gradient(135deg, #0d47a1, #1976d2); color: #fff; padding: 20px; margin-bottom: 20px; margin-left: auto; margin-right: auto;">
                                        <div class="card-logo" style="position: absolute; top: 20px; left: 20px;">
                                            <img class="logo" src="{{ get_fav($basic_settings) }}" alt="site-logo" style="width: 40px;">
                                        </div>
                                        <div class="card-number" style="position: absolute; top: 80px; left: 20px; font-size: 1.3rem; letter-spacing: 2px; font-weight: bold;">
                                            {{ implode(' ', str_split(@$myCard->card_pan, 4)) }}
                                        </div>
                                        <div class="card-holder" style="position: absolute; bottom: 50px; left: 20px; font-size: 0.9rem;">
                                            {{ auth()->user()->fullname }}
                                        </div>
                                        <div class="valid-thru" style="position: absolute; bottom: 20px; left: 20px; font-size: 0.8rem;">
                                            {{ date('m/Y', strtotime($myCard->expiration)) }}
                                        </div>
                                        <div class="card-cvv" style="position: absolute; bottom: 20px; right: 20px; font-size: 0.8rem;">
                                            CVV: {{ @$myCard->cvv }}
                                        </div>
                                        <div class="card-type" style="position: absolute; top: 20px; right: 20px; font-size: 1rem;">
                                            {{ __($myCard->card_type == "visa" ? "VISA" : "Mastercard") }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-actions mt-4">
                                <a href="javascript:void(0)" class="btn btn-outline-primary me-2 fundCard" data-id="{{ $myCard->id }}">充值</a>
                                <a href="javascript:void(0)" class="btn btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#withdrawModal">转出</a>
                                <a href="#" class="btn btn-outline-warning me-2">冻结</a>
                                <a href="#" class="btn btn-outline-danger">删除</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 右侧内容 -->
                <div class="col-md-8 mb-4">
                    <!-- 左对齐的复制按钮 -->
                    <div class="d-flex justify-content-start mb-3">
                        <button id="copyCardDetailsBtn" class="btn btn-outline-primary">
                            <i class="fas fa-copy"></i> 复制信息
                        </button>
                    </div>

                    <!-- 调整右侧卡片的大小 -->
                    <div class="row g-4">
                        <div class="col-md-6 col-lg-6">
                            <!-- 可用余额卡片 -->
                            <div class="card rounded-12 shadow h-100">
                                <div class="card-body p-3">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-md bg-light-primary text-primary rounded-12 me-3">
                                            <i class="fas fa-wallet fa-lg"></i>
                                        </div>
                                        <div>
                                            <span class="caption text-gray-600 d-block mb-1">可用余额</span>
                                            <span class="h4 mb-0">${{ getAmount(@$myCard->amount, 2) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 累计消费卡片 -->
                        <div class="col-md-6 col-lg-6">
                            <div class="card rounded-12 shadow h-100">
                                <div class="card-body p-3">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-md bg-light-success text-success rounded-12 me-3">
                                            <i class="fas fa-shopping-cart fa-lg"></i>
                                        </div>
                                        <div>
                                            <span class="caption text-gray-600 d-block mb-1">累计消费</span>
                                            <span class="h4 mb-0">${{ getAmount(@$myCard->total_spent, 2) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 累计充值卡片 -->
                        <div class="col-md-6 col-lg-6">
                            <div class="card rounded-12 shadow h-100">
                                <div class="card-body p-3">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-md bg-light-info text-info rounded-12 me-3">
                                            <i class="fas fa-coins fa-lg"></i>
                                        </div>
                                        <div>
                                            <span class="caption text-gray-600 d-block mb-1">累计充值</span>
                                            <span class="h4 mb-0">${{ number_format($totalreloaded, 2) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 累计转出卡片 -->
                        <div class="col-md-6 col-lg-6">
                            <div class="card rounded-12 shadow h-100">
                                <div class="card-body p-3">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-md bg-light-danger text-danger rounded-12 me-3">
                                            <i class="fas fa-exchange-alt fa-lg"></i>
                                        </div>
                                        <div>
                                            <span class="caption text-gray-600 d-block mb-1">累计转出</span>
                                            <span class="h4 mb-0">${{ number_format($totalwithdrawn, 2) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 账单地址文本 -->
                        <div class="col-12">
                            <div class="card rounded-12 shadow h-100">
                                <div class="card-body p-3">
                                    <h5 class="card-title mb-2">账单地址</h5>
                                    <p class="mb-0 text-gray-600">{{ @$myCard->address }}, {{ @$myCard->city }}, {{ @$myCard->state }}, {{ @$myCard->zipcode }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 交易记录表格 -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card rounded-12 shadow h-100">
                        <div class="d-flex align-items-center px-3 px-md-4 py-3">
                            <h5 class="card-header-title mb-0 ps-md-2 font-weight-semibold">交易记录</h5>
                        </div>
                        <div class="table-responsive mb-0">
                            <table class="table card-table table-nowrap overflow-hidden">
                                <thead>
                                    <tr>
                                        <th>{{ __('日期') }}</th>
                                        <th>{{ __('交易类型') }}</th>
                                        <th>{{ __('详情') }}</th>
                                        <th>{{ __('金额') }}</th>
                                        <th>{{ __('币种') }}</th>
                                        <th>{{ __('交易状态') }}</th>
                                        <th>{{ __('备注') }}</th>
                                    </tr>
                                </thead>
                                <tbody class="list">
                                    @forelse ($transactions as $transaction)
                                        <tr>
                                            <td>{{ $transaction->created_at->format('Y-m-d H:i') }}</td>
                                            <td>{{ $transaction->type }}</td>
                                            <td>{{ $transaction->product }}</td>
                                            <td>{{ $transaction->amount }}</td>
                                            <td>{{ $transaction->currency }}</td>
                                            <td>
                                                @if($transaction->status == \App\Constants\PaymentGatewayConst::STATUSSUCCESS)
                                                    <span class="badge bg-success text-success-500">{{ __('成功') }}</span>
                                                @elseif($transaction->status == \App\Constants\PaymentGatewayConst::STATUSPENDING)
                                                    <span class="badge bg-warning text-warning-500">{{ __('待处理') }}</span>
                                                @elseif($transaction->status == \App\Constants\PaymentGatewayConst::STATUSFAILED)
                                                    <span class="badge bg-danger text-danger-500">{{ __('失败') }}</span>
                                                @endif
                                            </td>
                                            <td>{{ $transaction->remarks }}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="5" class="text-center">{{ __('暂无交易记录') }}</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                        <!-- 分页控件 -->
                        <div class="d-flex justify-content-between align-items-center px-3 px-md-4 py-3">
                            {{ $transactions->links('vendor.pagination.muse-dashboard') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @include('user.partials.footer')
    </div>

    <!-- Fund Card Modal -->
    <div class="modal fade" id="FundCardModal" tabindex="-1" aria-labelledby="card-modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">{{ __("Fund Card") }}</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="card-form row g-4" action="{{ route('user.virtual.card.fund') }}" method="POST">
                        @csrf
                        <input type="hidden" name="id">
                        <div class="col-12">
                            <div class="form-group">
                                <label>{{ __("Fund Amount") }}<span>*</span></label>
                                <input type="number" class="form-control" required placeholder="{{ __("Enter Amount") }}" name="fund_amount" value="{{ old("fund_amount") }}">
                                <div class="currency mt-2">
                                    <p>{{ get_default_currency_code() }}</p>
                                </div>
                                <div class="d-flex justify-content-between mt-3">
                                    <code class="text--base fw-bold balance-show fund-limit-show">--</code>
                                    <code class="text--base fw-bold balance-show">{{ __(" Balance: ") }} {{ authWalletBalance() }} {{ get_default_currency_code() }}</code>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="ps-4">
                                <div class="d-flex justify-content-between">
                                    <h3 class="fs-6 fw-lighter py-1 text-capitalize">&bull; {{ __("Total Charge") }} :</h3>
                                    <h3 class="fs-6 fw-lighter py-1 text-capitalize fund-fees-show">--</h3>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h3 class="fs-6 fw-lighter py-1 text-capitalize">&bull; {{ __("Total Pay") }} :</h3>
                                    <h3 class="fs-6 fw-lighter py-1 text-capitalize fund-payable-total">--</h3>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary w-100 btn-lg fund-btn">{{ __("Confirm") }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 转出模态框 -->
    <div class="modal fade" id="withdrawModal" tabindex="-1" aria-labelledby="withdrawModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content shadow-dark-80">
          <form action="{{ route('user.virtual.card.withdraw') }}" method="POST">
            @csrf
            <div class="modal-header border-0 pb-0 align-items-start ps-4">
              <h5 class="modal-title pt-3" id="withdrawModalLabel">从卡片转出资金</h5>
              <button type="button" class="btn btn-icon p-0" data-bs-dismiss="modal" aria-label="关闭">
                <!-- Close icon -->
                <svg data-name="icons/tabler/close" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                  <rect data-name="Icons/Tabler/Close background" width="16" height="16" fill="none"></rect>
                  <path d="M.82.1l.058.05L6,5.272,11.122.151A.514.514,0,0,1,11.9.82l-.05.058L6.728,6l5.122,5.122a.514.514,0,0,1-.67.777l-.058-.05L6,6.728.878,11.849A.514.514,0,0,1,.1,11.18l.05-.058L5.272,6,.151.878A.514.514,0,0,1,.75.057Z" transform="translate(2 2)" fill="#1e1e1e"></path>
                </svg>
              </button>
            </div>
            <div class="modal-body pt-2 px-4">
              <div class="mb-3">
                <label for="withdraw_amount" class="form-label">转出金额</label>
                <input type="number" class="form-control" name="withdraw_amount" id="withdraw_amount" min="0" step="0.01" required>
                <input type="hidden" name="id" value="{{ $myCard->id }}">
              </div>
              <p>卡片余额：{{ number_format($myCard->amount, 2) }}</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-light px-2" data-bs-dismiss="modal">
                <span class="px-1">取消</span>
              </button>
              <button type="submit" class="btn btn-primary px-2 ms-2">
                <span class="px-1">确认转出</span>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- 添加隐藏的 textarea，用于复制内容 -->
    <textarea id="cardDetailsText" style="position: absolute; left: -9999px; top: -9999px;"></textarea>

    <!-- 添加在页面合适的位置 -->
    <div id="copySuccessAlert" class="alert alert-success alert-dismissible fade show" role="alert" style="position: fixed; top: 20px; right: 20px; z-index: 1050; display: none;">
        <i class="fas fa-check-circle me-2"></i>
        {{ __('卡片信息已复制到剪贴板') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="关闭"></button>
    </div>
@endsection

@push('script')
<script>
    $(document).ready(function() {
        $('.fundCard').on('click', function() {
            var modal = $('#FundCardModal');
            modal.find('input[name=id]').val($(this).data('id'));
            getLimit();
            getFees();
            getPreview();
            modal.modal('show');
        });

        $("input[name=fund_amount]").on('keyup focusout', function(){
            getFees();
            getPreview();
        });

        function getLimit() {
            var currencyCode = acceptVar().currencyCode;
            var currencyRate = acceptVar().currencyRate;

            var min_limit = acceptVar().currencyMinAmount;
            var max_limit = acceptVar().currencyMaxAmount;
            if($.isNumeric(min_limit) || $.isNumeric(max_limit)) {
                var min_limit_calc = parseFloat(min_limit/currencyRate).toFixed(2);
                var max_limit_calc = parseFloat(max_limit/currencyRate).toFixed(2);
                $('.fund-limit-show').html("{{ __('Limit') }} " + min_limit_calc + " " + currencyCode + " - " + max_limit_calc + " " + currencyCode);

                return {
                    minLimit:min_limit_calc,
                    maxLimit:max_limit_calc,
                };
            } else {
                $('.fund-limit-show').html("--");
                return {
                    minLimit:0,
                    maxLimit:0,
                };
            }
        }

        function acceptVar() {
            var currencyCode = "{{ get_default_currency_code() }}";
            var currencyRate = "{{ get_default_currency_rate() }}";
            var currencyMinAmount ="{{getAmount($cardReloadCharge->min_limit)}}";
            var currencyMaxAmount = "{{getAmount($cardReloadCharge->max_limit)}}";
            var currencyFixedCharge = "{{getAmount($cardReloadCharge->fixed_charge)}}";
            var currencyPercentCharge = "{{getAmount($cardReloadCharge->percent_charge)}}";

            return {
                currencyCode:currencyCode,
                currencyRate:currencyRate,
                currencyMinAmount:currencyMinAmount,
                currencyMaxAmount:currencyMaxAmount,
                currencyFixedCharge:currencyFixedCharge,
                currencyPercentCharge:currencyPercentCharge,
            };
        }

        function feesCalculation() {
            var currencyCode = acceptVar().currencyCode;
            var currencyRate = acceptVar().currencyRate;
            var sender_amount = $("input[name=fund_amount]").val();
            sender_amount == "" ? (sender_amount = 0) : (sender_amount = sender_amount);

            var fixed_charge = acceptVar().currencyFixedCharge;
            var percent_charge = acceptVar().currencyPercentCharge;
            if ($.isNumeric(percent_charge) && $.isNumeric(fixed_charge) && $.isNumeric(sender_amount)) {
                // Process Calculation
                var fixed_charge_calc = parseFloat(currencyRate * fixed_charge);
                var percent_charge_calc = parseFloat(currencyRate)*(parseFloat(sender_amount) / 100) * parseFloat(percent_charge);
                var total_charge = parseFloat(fixed_charge_calc) + parseFloat(percent_charge_calc);
                total_charge = parseFloat(total_charge).toFixed(2);
                // return total_charge;
                return {
                    total: total_charge,
                    fixed: fixed_charge_calc,
                    percent: percent_charge,
                };
            } else {
                // return "--";
                return false;
            }
        }

        function getFees() {
            var currencyCode = acceptVar().currencyCode;
            var percent = acceptVar().currencyPercentCharge;
            var charges = feesCalculation();
            if (charges == false) {
                return false;
            }
            $(".fund-fees-show").html( parseFloat(charges.fixed).toFixed(2) + " " + currencyCode + " + " + parseFloat(charges.percent).toFixed(2) + "% = " + parseFloat(charges.total).toFixed(2) + " " + currencyCode);
        }
        function getPreview() {
            var senderAmount = $("input[name=fund_amount]").val();
            var charges = feesCalculation();
            var sender_currency = acceptVar().currencyCode;
            var sender_currency_rate = acceptVar().currencyRate;

            senderAmount == "" ? senderAmount = 0 : senderAmount = senderAmount;
            // Sending Amount
            // Fees
            var charges = feesCalculation();

            var totalPay = parseFloat(senderAmount) * parseFloat(sender_currency_rate)
            var pay_in_total = 0;
            if(senderAmount == 0 ||  senderAmount == ''){
                pay_in_total = 0;
            }else{
                pay_in_total =  parseFloat(totalPay) + parseFloat(charges.total);
            }
            $('.fund-payable-total').html( pay_in_total + " " + sender_currency);

        }

        // 一键复制功能
        $('#copyCardDetailsBtn').on('click', function() {
            // 准备需要复制的卡片信息
            var cardNumber = "{{ $myCard->card_pan }}";
            var expirationDate = "{{ date('m/Y', strtotime($myCard->expiration)) }}";
            var cvv = "{{ $myCard->cvv }}";
            var cardHolder = "{{ auth()->user()->fullname }}";
            var cardType = "{{ $myCard->card_type == 'visa' ? 'VISA' : 'Mastercard' }}";

            var cardDetails = "卡片类型：" + cardType + "\n" +
                              "卡号：" + cardNumber + "\n" +
                              "有效期：" + expirationDate + "\n" +
                              "CVV：" + cvv + "\n" +
                              "持卡人：" + cardHolder;

            // 将卡片信息放入隐藏的 textarea
            var $temp = $("<textarea>");
            $("body").append($temp);
            $temp.val(cardDetails).select();

            try {
                var successful = document.execCommand('copy');
                if (successful) {
                    // 显示复制成功的 Alert
                    $('#copySuccessAlert').fadeIn();

                    // 设置 3 秒后自动隐藏
                    setTimeout(function() {
                        $('#copySuccessAlert').fadeOut();
                    }, 3000);
                } else {
                    alert('{{ __('复制失败，请手动复制') }}');
                }
            } catch (err) {
                alert('{{ __('复制失败，请手动复制') }}');
            }

            // 移除临时元素
            $temp.remove();
        });

        // 当点击关闭按钮时，隐藏 Alert
        $('#copySuccessAlert .btn-close').on('click', function() {
            $('#copySuccessAlert').fadeOut();
        });
    });
</script>
@endpush
