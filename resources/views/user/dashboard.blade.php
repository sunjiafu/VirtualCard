@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("Dashboard"),
            'url'   => setRoute("user.dashboard"),
        ]
    ], 'active' => __("Dashboard")])
@endsection

@section('content')
    <div class="px-3 px-xxl-5 py-3 py-lg-4 border-bottom border-gray-200 after-header">
      <div class="container-fluid px-0">
        <div class="row align-items-center">
          <div class="col">
            <h1 class="h2 mb-0">{{__("Dashboard")}}</h1>
          </div>
        </div>
      </div>
    </div>
    <div class="p-3 p-xxl-5">
      <div class="container-fluid px-0">
        <div class="row">
          <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-3">
            <div class="card mb-4 rounded-12 shadow">
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
          <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-3">
            <div class="card mb-4 rounded-12 shadow">
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
          <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-3">
            <div class="card mb-4 rounded-12 shadow">
              <div class="card-body p-3 p-xl-3 p-xxl-4">
                <div class="row align-items-center">
                  <div class="col-5 col-xxl-6">
                    <span class="caption text-gray-600 d-block mb-1">激活卡片</span>
                    <span class="h3 mb-0">{{ @$virtualCards }}</span>
                    <span class="d-block fs-11 mt-2 font-weight-semibold"><svg class="me-1" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg> 张</span>
                  </div>
                  <div class="col-7 col-xxl-6 pe-xxl-0">
                    <div id="CardChart"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-12 col-xl-6 col-xxl-3">
            <div class="card mb-4 rounded-12 shadow">
              <div class="card-body p-3 p-xl-3 p-xxl-4">
                <div class="row align-items-center">
                  <div class="col-5 col-xxl-6">
                    <span class="caption text-gray-600 d-block mb-1">提交工单</span>
                    <span class="h3 mb-0">{{ @$active_tickets }}</span>
                    <span class="d-block fs-11 mt-2 font-weight-semibold"><svg class="me-1" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg> 待处理</span>
                  </div>
                  <div class="col-7 col-xxl-6 pe-xxl-0">
                    <div id="TicketChart"></div>
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
                <h5 class="card-header-title mb-0 ps-md-2 font-weight-semibold">最近交易</h5>
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
                          <td colspan="5" class="text-center">{{ __("No Record Found!") }}</td>
                        </tr>
                      @endforelse
                    @endisset
                  </tbody>
                </table>
              </div>
              <div class="d-flex align-items-center p-3 p-md-4 border-top border-gray-200">
                <a href="{{ setRoute('user.transactions.index','add-money') }}" class="my-1 tiny font-weight-semibold mx-auto btn btn-link link-dark">
                  查看全部
                  <svg class="ms-1" data-name="icons/tabler/chevron right" xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 16 16">
                    <rect data-name="Icons/Tabler/Chevron Right background" width="16" height="16" fill="none"></rect>
                    <path d="M.26.26A.889.889,0,0,1,1.418.174l.1.086L8.629,7.371a.889.889,0,0,1,.086,1.157l-.086.1L1.517,15.74A.889.889,0,0,1,.174,14.582l.086-.1L6.743,8,.26,1.517A.889.889,0,0,1,.174.36Z" transform="translate(4)" fill="#1e1e1e"></path>
                  </svg>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12 col-xxl-6 mb-4">
            <div class="card rounded-12 shadow-dark-80">
              <div class="card-body p-0">
                <div class="d-flex align-items-center border-bottom border-gray-200 pb-3 px-4 pt-4">
                  <h5 class="card-title mb-0 font-weight-bold">系统公告</h5>
                </div>
                <div class="px-4 py-3" style="max-height: 300px; overflow-y: auto;">
                  <div class="alert alert-info mb-3" role="alert">
                    <h6 class="alert-heading font-weight-bold">VelixPay虚拟信用卡平台</h6>
                    <p class="mb-0">请先详细阅读以下用卡须知！</p>
                  </div>
                  
                  <div class="mb-3">
                    <h6 class="font-weight-semibold">1. 预付费政策</h6>
                    <p>所有卡片预付费，我们不提供任何信用额度。</p>
                  </div>
                  
                  <div class="mb-3">
                    <h6 class="font-weight-semibold">2. 用卡前沟通</h6>
                    <p>请在用卡之前，与商务沟通清楚使用需求和用卡场景，方便我们为您正确设置系统费率和适用的卡bin。</p>
                  </div>
                  
                  <div class="mb-3">
                    <h6 class="font-weight-semibold">3. 关于用卡拒付率</h6>
                    <ul class="list-unstyled">
                      <li class="mb-2">• 支付失败比例超过20%，我们会收取授权费用2%(最低0.3美金)每笔，无论失败还是成功授权。</li>
                      <li class="mb-2">• 请在交易前安排卡片充值，并确保卡内有足够的余额进行交易。</li>
                      <li>• 如果卡片不再使用，需要在绑定过的所有相关账户进行解绑后，再进行销卡动作。</li>
                    </ul>
                  </div>
                  
                  <!-- 其他公告内容 -->
                  
                  <div class="alert alert-warning mt-4" role="alert">
                    <p class="mb-0">祝您用卡愉快。同时请注意，请务必遵守国家的法律法规，不要将卡用于高风险行业。我们是正规的平台，仅针对海外广告投放、电商平台、物流、留学、航旅、服务器等场景用卡。如果您有其它场景，请提前知会我们。</p>
                  </div>
                  
                  <p class="text-end mt-3 mb-0"><strong>VelixPay卡团队</strong></p>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-12 col-xxl-6 mb-4">
            <div class="card rounded-12 shadow-sm">
              <div class="card-body p-0">
                <div class="d-flex align-items-center border-bottom p-3">
                  <h5 class="card-title mb-0 font-weight-bold">客户经理</h5>
                </div>
                <div class="p-3" style="height: 300px;">
                  <div class="d-flex flex-column justify-content-center h-100">
                    <div class="mb-4 text-center">
                      <img src="{{ asset('public/assets/img/avatar1.png') }}" class="rounded-circle mb-3" width="100" height="100" alt="客户经理头像">
                      <h6 class="font-weight-bold mb-1">Lariena</h6>
                      <p class="text-muted mb-0">资深客户经理</p>
                    </div>
                    <div class="d-flex justify-content-center">
                      <a href="https://t.me/Lariena" target="_blank" class="btn btn-outline-primary me-2">
                        <i class="fab fa-telegram-plane me-2"></i>Telegram
                      </a>
                      <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#wechatModal">
                        <i class="fab fa-weixin me-2"></i>微信
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    
      </div>
   
   

  <!-- 微信二维码模态框 -->
<div class="modal fade" id="wechatModal" tabindex="-1" aria-labelledby="wechatModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content shadow-dark-80">
      <div class="modal-header border-0 pb-0 align-items-start ps-4">
        <h5 class="modal-title pt-3" id="wechatModalLabel">微信二维码</h5>
        <button type="button" class="btn btn-icon p-0" data-bs-dismiss="modal" aria-label="Close">
          <svg data-name="icons/tabler/close" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
            <rect data-name="Icons/Tabler/Close background" width="16" height="16" fill="none"></rect>
            <path d="M.82.1l.058.05L6,5.272,11.122.151A.514.514,0,0,1,11.9.82l-.05.058L6.728,6l5.122,5.122a.514.514,0,0,1-.67.777l-.058-.05L6,6.728.878,11.849A.514.514,0,0,1,.1,11.18l.05-.058L5.272,6,.151.878A.514.514,0,0,1,.75.057Z" transform="translate(2 2)" fill="#1e1e1e"></path>
          </svg>
        </button>
      </div>
      <div class="modal-body pt-2 px-4 text-center">
        <img src="{{ asset('public/frontend/images/element/wechat_qr.jpg') }}" class="img-fluid" alt="微信二维码">
      </div>
    </div>
  </div>
</div>
@include('user.partials.footer')
  @endsection


