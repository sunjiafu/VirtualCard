<div class="table-responsive mb-0">
    <table class="table card-table table-nowrap overflow-hidden">
        <thead>
            <tr>
                <th>{{ __('日期') }}</th>
                <th>{{ __('卡号') }}</th>
                <th>{{ __('交易类型') }}</th>
                <th>{{ __('详情') }}</th>
                <th>{{ __('金额') }}</th>
                <th>{{ __('币种') }}</th>
                <th>{{ __('状态') }}</th>
                @if(isset($extraHeaders))
                    @foreach($extraHeaders as $header)
                        <th>{{ $header }}</th>
                    @endforeach
                @endif
            </tr>
        </thead>
        <tbody>
            @forelse ($transactions as $transaction)
                <tr>
                    <!-- 日期 -->
                    <td>{{ $transaction->created_at->format('Y-m-d H:i') }}</td>

                    <!-- 卡号，添加链接 -->
                    <td>
                        @if($transaction->card)
                            <a href="{{ route('user.virtual.card.details', $transaction->card->card_id) }}">
                                {{ '**** ' . substr($transaction->card->card_pan, -4) }}
                            </a>
                        @else
                            {{ __('未知卡片') }}
                        @endif
                    </td>

                    <!-- 交易类型 -->
                    <td>{{ $transaction->type_label ?? $transaction->type }}</td>

                    <!-- 详情 -->
                    <td>{{ $transaction->product }}</td>

                    <!-- 金额 -->
                    <td>{{ getAmount($transaction->amount, 2) }}</td>

                    <!-- 币种 -->
                    <td>{{ $transaction->currency }}</td>

                    <!-- 状态 -->
                    <td>
                        @if($transaction->status == \App\Constants\PaymentGatewayConst::STATUSSUCCESS || $transaction->status == 1)
                            <span class="badge bg-success">{{ __('成功') }}</span>
                        @elseif($transaction->status == \App\Constants\PaymentGatewayConst::STATUSPENDING || $transaction->status == 2)
                            <span class="badge bg-warning">{{ __('待处理') }}</span>
                        @elseif($transaction->status == \App\Constants\PaymentGatewayConst::STATUSFAILED || $transaction->status == 3)
                            <span class="badge bg-danger">{{ __('失败') }}</span>
                        @endif
                    </td>

                    <!-- 如果有额外的列数据 -->
                    @if(isset($extraColumns))
                        @foreach($extraColumns as $column)
                            <td>{!! $column($transaction) !!}</td>
                        @endforeach
                    @endif
                </tr>
            @empty
                <tr>
                    <td colspan="{{ 7 + (isset($extraHeaders) ? count($extraHeaders) : 0) }}" class="text-center">{{ __('没有交易记录') }}</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div> 