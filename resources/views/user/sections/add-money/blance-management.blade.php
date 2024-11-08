@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("仪表盘"),
            'url'   => setRoute("user.dashboard"),
        ],
        [
            'name'  => __("余额管理"),
            'url'   => setRoute("user.balance.management"),
        ]
    ], 'active' => __("余额管理")])
@endsection

@section('content')
<div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
  <div class="container-fluid px-0">
    <div class="row align-items-center">
      <div class="col">
        <h1 class="h2 mb-0">余额管理</h1>
      </div>
    </div>
  </div>
</div>
<div class="p-3 p-xxl-5">
  <div class="container-fluid px-0">
    <div class="row">
      <div class="col-12 col-xxl-6 mb-4">
        <div class="card rounded-12 shadow">
          <div class="card-body p-3 p-xl-3 p-xxl-4">
            <div class="row align-items-center">
              <div class="col-5 col-xxl-6">
                <span class="caption text-gray-600 d-block mb-1">当前余额</span>
                <span class="h3 mb-0">${{ authWalletBalance() }}</span>
                <span class="d-block fs-11 mt-2 font-weight-semibold"><svg class="me-1" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 1v22M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg> 可用</span>
              </div>
              <div class="col-7 col-xxl-6 px-xxl-0">
                <div id="BalanceChart"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 col-xxl-6 mb-4">
        <div class="card rounded-12 shadow">
          <div class="card-body p-3 p-xl-3 p-xxl-4">
            <div class="row align-items-center">
              <div class="col-5 col-xxl-6">
                <span class="caption text-gray-600 d-block mb-1">累计充值</span>
                <span class="h3 mb-0">{{ getAmount(@$totalAddMoney,2) }}</span>
                <span class="d-block fs-11 mt-2 font-weight-semibold"><svg class="me-1" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20v-6M6 20V10M18 20V4"></path></svg> 总额</span>
              </div>
              <div class="col-7 col-xxl-6 pe-xxl-0">
                <div id="RechargeChart"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-12 mb-4">
        <div class="card rounded-12 shadow-dark-80">
          <div class="d-flex align-items-center px-3 px-md-4 py-3">
            <h5 class="card-header-title mb-0 ps-md-2 font-weight-semibold">交易记录</h5>
          </div>
          <div class="table-responsive mb-0">
            <table class="table card-table table-nowrap overflow-hidden">
              <thead>
                <tr>
                  <th>交易类型</th>
                  <th>交易金额</th>
                  <th>状态</th>
                  <th>可用余额</th>
                  <th>交易时间</th>
                </tr>
              </thead>
              <tbody class="list">
                @isset($transactions)
                  @forelse ($transactions as $item)
                    <tr>
                      <td>
                        <div class="d-flex align-items-center">
                          <span class="avatar avatar-sm shadow-sm rounded-circle me-1 d-flex align-items-center justify-content-center bg-white">
                            @if (@$item->attribute == payment_gateway_const()::SEND)
                              <i class="las la-arrow-up"></i>
                            @else
                              <i class="las la-arrow-down"></i>
                            @endif
                          </span>
                          <span class="ps-2 font-weight-semibold text-gray-700">{{ @$item->type }}</span>
                        </div>
                      </td>
                      <td>{{ get_amount(@$item->request_amount,get_default_currency_code()) }}</td>
                      <td>
                        @if(@$item->status == 1)
                          <span class="badge bg-teal-50 text-teal-500">成功</span>
                        @elseif(@$item->status == 2)
                          <span class="badge bg-warning-50 text-warning">待处理</span>
                        @elseif(@$item->status == 3)
                          <span class="badge bg-red-50 text-dnd">已拒绝</span>
                        @endif
                      </td>
                      <td>{{ get_amount(@$item->available_balance,get_default_currency_code()) }}</td>
                      <td>{{ @$item->created_at->format('Y-n-j H:i') }}</td>
                    </tr>
                  @empty
                    <tr>
                      <td colspan="5" class="text-center">{{ __("暂无交易记录") }}</td>
                    </tr>
                  @endforelse
                @endisset
              </tbody>
            </table>
          </div>
          @if($transactions->hasPages())
            <div class="card-footer pb-0">
              {{ $transactions->links() }}
            </div>
          @endif
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

@push('script')
<script>
  // 这里可以添加余额图表和充值图表的JavaScript代码
  // 例如使用Chart.js或其他图表库来绘制BalanceChart和RechargeChart
</script>
@endpush