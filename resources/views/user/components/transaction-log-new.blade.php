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