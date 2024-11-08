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
                            <th>{{ __("有效期") }}</th>
                            <th>{{ __("安全码") }}</th>
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
                                    <img src="{{ asset('public/frontend/images/logo/visa.svg') }}" alt="Visa" style="width: 48px; height: auto; display: inline-block; vertical-align: middle;">
                                @elseif($myCard->card_type === "master")
                                    <img src="{{ asset('public/frontend/images/logo/master.svg') }}" alt="Mastercard" style="width: 48px; height: auto; display: inline-block; vertical-align: middle;">
                                @else
                                    {{ $myCard->card_type }}
                                @endif
                            </td>
                            <td>
                                <span class="obfuscated card-pan">{{ '**** **** **** ' . substr($myCard->card_pan, -4) }}</span>
                                <span class="full card-pan" style="display: none;">{{ $myCard->card_pan }}</span>
                                <button class="btn btn-sm btn-link toggle-btn" data-field="card-pan" title="{{ __('显示卡号') }}"><i class="far fa-eye"></i></button>
                            </td>
                            <td>{{ $myCard->name_on_card ?? auth()->user()->fullname }}</td>
                            <td>
                                <span class="obfuscated expiration">{{ '**/**' }}</span>
                                <span class="full expiration" style="display: none;">{{ date("m/Y", strtotime($myCard->expiration)) }}</span>
                                <button class="btn btn-sm btn-link toggle-btn" data-field="expiration" title="{{ __('显示有效期') }}"><i class="far fa-eye"></i></button>
                            </td>
                            <td>
                                <span class="obfuscated cvv">{{ '***' }}</span>
                                <span class="full cvv" style="display: none;">{{ $myCard->cvv }}</span>
                                <button class="btn btn-sm btn-link toggle-btn" data-field="cvv" title="{{ __('显示安全码') }}"><i class="far fa-eye"></i></button>
                            </td>
                            <td>{{ getAmount(@$myCard->amount,2) }}{{ get_default_currency_symbol() }}</td>
                            <td>
                                @if($myCard->is_active == 0)
                                    <span class="badge bg-warning">{{ __("待审核") }}</span>
                                @else
                                    <span class="badge bg-success">{{ __("已激活") }}</span>
                                @endif
                            </td>
                            <td>
                                <a href="javascript:void(0)" class="btn btn-sm btn-success fundCard" data-id="{{ $myCard->id }}">{{ __("充值") }}</a>
                                <a href="javascript:void(0)" class="btn btn-sm btn-primary withdrawCard" data-id="{{ $myCard->id }}" data-amount="{{ $myCard->amount }}">{{ __("转出") }}</a>
                                @if($myCard->is_active == 0)
                                    <a href="javascript:void(0);" class="btn btn-sm btn-secondary show-alert">{{ __("详情") }}</a>
                                @else
                                    <a href="{{ setRoute('user.virtual.card.details',$myCard->card_id) }}" class="btn btn-sm btn-secondary">{{ __("详情") }}</a>
                                @endif
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="8" class="text-center">{{ __("没有创建任何虚拟信用卡！") }}</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            
        </div>
        @include('user.partials.footer')
        <!-- 充值模态框 -->
        <div class="modal fade" id="FundCardModal" tabindex="-1" role="dialog" aria-hidden="true">
            <!-- 模态框内容与 details.blade.php 类似 -->
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content shadow-dark-80">
                    <div class="modal-header border-0 pb-0 align-items-start ps-4">
                        <h5 class="modal-title pt-3">{{ __("充值") }}</h5>
                        <button type="button" class="btn btn-icon p-0" data-bs-dismiss="modal" aria-label="Close">
                            <i class="las la-times"></i>
                        </button>
                    </div>
                    <div class="modal-body pt-2 px-4">
                        <form class="card-form row g-4" action="{{ route('user.virtual.card.fund') }}" method="POST">
                            @csrf
                            <input type="hidden" name="id" value="">
                            <div class="col-12">
                                <label for="fund_amount">{{ __("充值金额") }}</label>
                                <input type="text" class="form-control form--control-2" id="fund_amount" name="fund_amount" placeholder="{{ __("输入充值金额") }}" required>
                                <small class="form-text text-muted">{{ __("限额：") }}<span id="fund_limit" class="fund-limit-show">--</span></small>
                            </div>
                            <div class="col-12">
                                <label>{{ __('充值费用') }} :</label>
                                <p class="fund-fees-show">--</p>
                            </div>
                            <div class="col-12">
                                <label>{{ __('总计') }} :</label>
                                <p class="fund-payable-total">--</p>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100 fund-btn">{{ __("确认充值") }}</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer border-0"></div>
                </div>
            </div>
        </div>

        <!-- 转出模态框 -->
        <div class="modal fade" id="WithdrawCardModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content shadow-dark-80">
                    <form action="{{ route('user.virtual.card.withdraw') }}" method="POST">
                        @csrf
                        <div class="modal-header border-0 pb-0 align-items-start ps-4">
                            <h5 class="modal-title pt-3">{{ __("从卡片转出资金") }}</h5>
                            <button type="button" class="btn btn-icon p-0" data-bs-dismiss="modal" aria-label="关闭">
                                <!-- 关闭图标 -->
                                <svg data-name="icons/tabler/close" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                                    <rect data-name="Icons/Tabler/Close background" width="16" height="16" fill="none"></rect>
                                    <path d="M.82.1l.058.05L6,5.272,11.122.151A.514.514,0,0,1,11.9.82l-.05.058L6.728,6l5.122,5.122a.514.514,0,0,1-.67.777l-.058-.05L6,6.728.878,11.849A.514.514,0,0,1,.1,11.18l.05-.058L5.272,6,.151.878A.514.514,0,0,1,.75.057Z" transform="translate(2 2)" fill="#1e1e1e"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="modal-body pt-2 px-4">
                            <div class="mb-3">
                                <label for="withdraw_amount" class="form-label">{{ __("转出金额") }}</label>
                                <input type="number" class="form-control" name="withdraw_amount" id="withdraw_amount" min="0" step="0.01" required>
                                <input type="hidden" name="id" value="">
                            </div>
                            <p>{{ __("卡片余额：") }}<span id="card_balance">--</span></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light px-2" data-bs-dismiss="modal">
                                <span class="px-1">{{ __("取消") }}</span>
                            </button>
                            <button type="submit" class="btn btn-primary px-2 ms-2">
                                <span class="px-1">{{ __("确认转出") }}</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- 卡片申请中提示 -->
        <div id="CardApplicationAlert" class="alert alert-warning alert-dismissible fade show pe-5" role="alert" style="display: none; position: fixed; top: 20px; right: 20px; z-index: 1051;">
            <i class="fas fa-exclamation-circle me-1"></i>
            <strong>{{ __('注意!') }}</strong> {{ __('您的卡片还在申请中，请稍后') }}
            <button type="button" class="close p-2" data-bs-dismiss="alert" aria-label="Close">
                <svg xmlns="http://www.w3.org/2000/svg" width="11.528" height="12" viewBox="0 0 11.528 12">
                    <path d="M.788.1l.055.05,4.92,5.122L10.684.151a.48.48,0,0,1,.7,0,.53.53,0,0,1,.048.67l-.048.058L6.463,6l4.92,5.122a.529.529,0,0,1,0,.727.48.48,0,0,1-.643.05l-.055-.05L5.764,6.728.843,11.849a.48.48,0,0,1-.7,0A.53.53,0,0,1,.1,11.18l.048-.058L5.065,6,.145.878a.529.529,0,0,1,0-.727A.48.48,0,0,1,.721.057Z" fill="#1E1E1E"/>
                </svg>
            </button>
        </div>
    </div>
</div>

@endsection

@push('script')
<script>
    // 显示和复制功能
    $(document).on('click', '.toggle-btn', function(){
        var field = $(this).data('field');
        var parentTd = $(this).closest('td');
        var obfuscatedSpan = parentTd.find('.obfuscated.' + field);
        var fullSpan = parentTd.find('.full.' + field);
        var icon = $(this).find('i');

        if(icon.hasClass('fa-eye')){
            // 显示完整信息
            obfuscatedSpan.hide();
            fullSpan.show();
            icon.removeClass('fa-eye').addClass('fa-copy');
            $(this).attr('title', '{{ __("复制") }}');
        } else if(icon.hasClass('fa-copy')){
            // 复制功能
            var textToCopy = fullSpan.text();
            copyToClipboard(textToCopy);
            alert('{{ __("复制成功") }}');
        }
    });

    function copyToClipboard(text) {
        var temp = $('<input>');
        $('body').append(temp);
        temp.val(text).select();
        document.execCommand('copy');
        temp.remove();
    }

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