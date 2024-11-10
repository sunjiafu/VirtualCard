@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("仪表盘"),
            'url'   => setRoute("user.dashboard"),
        ]
    ], 'active' => __(@$page_title)])
@endsection

@section('content')
<div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
    <div class="container-fluid px-0">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h2 mb-0">{{ __(@$page_title) }}</h1>
            </div>
            <div class="col-auto">
                {{-- @if ($totalCards  < $card_limit ) --}}
                <a href="{{ setRoute('user.virtual.card.add.card') }}" class="btn btn-primary buyCard"><i class="las la-plus"></i> {{__("创建新卡")}}</a>
                {{-- @endif --}}
            </div>
        </div>
    </div>
</div>
<div class="p-3 p-xxl-5">
    <div class="container-fluid px-0">
        <!-- 虚拟信用卡数据表格 -->
        <div class="card rounded-12 shadow-dark-80">
            <div class="table-responsive mb-0">
                <table class="table card-table table-nowrap overflow-hidden">
                    <thead>
                        <tr>
                            <th>{{ __("卡片类型") }}</th>
                            <th>{{ __("卡号") }}</th>
                            <th>{{ __("持卡人姓名") }}</th>
                            <th>{{ __("可用余额") }}</th>
                            <th>{{ __("状态") }}</th>
                            <th>{{ __("操作") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($myCards ?? [] as $myCard)
                        <tr>
                            <td>
                                @if($myCard->card_type === "visa")
                                    <img src="{{ asset('public/frontend/images/logo/visa.svg') }}" alt="Visa" style="width: 48px; height: auto;">
                                @elseif($myCard->card_type === "master")
                                    <img src="{{ asset('public/frontend/images/logo/master.svg') }}" alt="Mastercard" style="width: 48px; height: auto;">
                                @else
                                    {{ $myCard->card_type }}
                                @endif
                            </td>
                            <td>
                                {{ '**** **** **** ' . substr($myCard->card_pan, -4) }}
                            </td>
                            <td>{{ $myCard->name_on_card ?? auth()->user()->fullname }}</td>
                            <td>{{ getAmount(@$myCard->amount,2) }}{{ get_default_currency_symbol() }}</td>
                            <td>
                                @if($myCard->is_active == 0)
                                    <span class="badge bg-warning">{{ __("待审核") }}</span>
                                @else
                                    <span class="badge bg-success">{{ __("已激活") }}</span>
                                @endif
                            </td>
                            <td>
                                <a href="{{ setRoute('user.virtual.card.details',$myCard->card_id) }}" class="btn btn-sm btn-secondary">{{ __("详情") }}</a>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="6" class="text-center">{{ __("没有创建任何虚拟信用卡！") }}</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
        @include('user.partials.footer')
    </div>
</div>

@endsection
@push('script')
<script>
   
    // 充值模态框逻辑
    $('.fundCard').on('click', function () {
        var modal = $('#FundCardModal');
        modal.find('input[name=id]').val($(this).data('id'));

        getLimit();
        getFees();
        getPreview();

        $("#fund_amount").keyup(function(){
            getFees();
            getPreview();
        });

        $("#fund_amount").focusout(function(){
            enterLimit();
        });

        function getLimit() {
            var currencyCode = acceptVar().currencyCode;
            var min_limit = acceptVar().currencyMinAmount;
            var max_limit = acceptVar().currencyMaxAmount;
            if($.isNumeric(min_limit) || $.isNumeric(max_limit)) {
                var min_limit_calc = parseFloat(min_limit).toFixed(2);
                var max_limit_calc = parseFloat(max_limit).toFixed(2);
                $('.fund-limit-show').html(min_limit_calc + " " + currencyCode + " - " + max_limit_calc + " " + currencyCode);
            }else {
                $('.fund-limit-show').html("--");
            }
        }

        function acceptVar() {
            var currencyCode = "{{ get_default_currency_code() }}";
            var currencyMinAmount ="{{getAmount($cardReloadCharge->min_limit)}}";
            var currencyMaxAmount = "{{getAmount($cardReloadCharge->max_limit)}}";
            var currencyFixedCharge = "{{getAmount($cardReloadCharge->fixed_charge)}}";
            var currencyPercentCharge = "{{getAmount($cardReloadCharge->percent_charge)}}";

            return {
                currencyCode:currencyCode,
                currencyMinAmount:currencyMinAmount,
                currencyMaxAmount:currencyMaxAmount,
                currencyFixedCharge:currencyFixedCharge,
                currencyPercentCharge:currencyPercentCharge,
            };
        }

        function feesCalculation() {
            var sender_amount = $("#fund_amount").val();
            sender_amount == "" ? (sender_amount = 0) : (sender_amount = sender_amount);

            var fixed_charge = acceptVar().currencyFixedCharge;
            var percent_charge = acceptVar().currencyPercentCharge;
            if ($.isNumeric(percent_charge) && $.isNumeric(fixed_charge) && $.isNumeric(sender_amount)) {
                var fixed_charge_calc = parseFloat(fixed_charge);
                var percent_charge_calc = (parseFloat(sender_amount) / 100) * parseFloat(percent_charge);
                var total_charge = parseFloat(fixed_charge_calc) + parseFloat(percent_charge_calc);
                total_charge = parseFloat(total_charge).toFixed(2);
                return {
                    total: total_charge,
                    fixed: fixed_charge_calc,
                    percent: percent_charge,
                };
            } else {
                return false;
            }
        }

        function getFees() {
            var currencyCode = acceptVar().currencyCode;
            var charges = feesCalculation();
            if (charges == false) {
                return false;
            }
            $(".fund-fees-show").html( parseFloat(charges.fixed).toFixed(2) + " " + currencyCode + " + " + parseFloat(charges.percent).toFixed(2) + "% = " + parseFloat(charges.total).toFixed(2) + " " + currencyCode);
        }

        function getPreview() {
            var senderAmount = $("#fund_amount").val();
            var charges = feesCalculation();
            var currencyCode = acceptVar().currencyCode;

            senderAmount == "" ? senderAmount = 0 : senderAmount = senderAmount;
            var pay_in_total = 0;
            if(senderAmount == 0 ||  senderAmount == ''){
                pay_in_total = 0;
            }else{
                pay_in_total =  parseFloat(senderAmount) + parseFloat(charges.total);
            }
            $('.fund-payable-total').html( parseFloat(pay_in_total).toFixed(2) + " " + currencyCode);
        }

        function enterLimit(){
            var min_limit = parseFloat(acceptVar().currencyMinAmount);
            var max_limit = parseFloat(acceptVar().currencyMaxAmount);
            var sender_amount = parseFloat($("#fund_amount").val());
            if( sender_amount < min_limit ){
                alert("{{ __('请遵守最小限额') }}");
                $('.fund-btn').attr('disabled',true)
            }else if(sender_amount > max_limit){
                alert("{{ __('请遵守最大限额') }}");
                $('.fund-btn').attr('disabled',true)
            }else{
                $('.fund-btn').attr('disabled',false)
            }
        }

        modal.modal('show');
    });

    // 转出模态框逻辑
    $('.withdrawCard').on('click', function() {
        var modal = $('#WithdrawCardModal');
        var id = $(this).data('id');
        var balance = $(this).data('amount');

        modal.find('input[name=id]').val(id);
        modal.find('#card_balance').text(balance);

        modal.modal('show');
    });

    // 其他JS代码保持不变
    $(".active-deactive-btn").click(function(){
        var actionRoute =  "{{ setRoute('user.virtual.card.make.default.or.remove') }}";
        var target = $(this).data('id');
        var btnText = $(this).text();
        var message     = `{{__('确定')}} <strong>${btnText}</strong>?`;
        openAlertModal(actionRoute,target,message,btnText,"POST");
    });

    $(document).on('click', '.show-alert', function() {
        $('#CardApplicationAlert').fadeIn();

        // 5秒后自动隐藏
        setTimeout(function() {
            $('#CardApplicationAlert').fadeOut();
        }, 5000);
    });

    // 关闭提示框
    $(document).on('click', '#CardApplicationAlert .close', function() {
        $('#CardApplicationAlert').fadeOut();
    });
</script>
@endpush
