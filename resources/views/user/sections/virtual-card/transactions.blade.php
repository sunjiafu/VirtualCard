@extends('user.layouts.maste-new')

@section('breadcrumb')
    @include('user.components.breadcrumb', [
        'breadcrumbs' => [
            ['name' => __("仪表盘"), 'url' => setRoute("user.dashboard")],
            ['name' => __("虚拟信用卡"), 'url' => setRoute("user.virtual.card.index")],
        ],
        'active' => __(@$page_title)
    ])
@endsection

@section('content')
<div class="container-fluid px-xxl-5 py-3 py-lg-4">
    <div class="row">
        <!-- 搜索表单 -->
        <div class="col-12 mb-4">
            <div class="card shadow-sm rounded-12">
                <div class="card-body">
                    <form method="GET" action="{{ route('user.virtual.card.transactions') }}">
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label for="card_number" class="form-label">{{ __("卡号后四位") }}</label>
                                <input type="text" name="card_number" id="card_number" class="form-control" value="{{ request()->input('card_number') }}" placeholder="1234">
                            </div>
                            <div class="col-md-3">
                                <label for="transaction_type" class="form-label">{{ __("交易类型") }}</label>
                                <select name="transaction_type" id="transaction_type" class="form-select">
                                    <option value="">{{ __("全部") }}</option>
                                    @foreach($transactionTypes as $key => $type)
                                        <option value="{{ $key }}" {{ request()->input('transaction_type') == $key ? 'selected' : '' }}>
                                            {{ $type }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="date_from" class="form-label">{{ __("开始日期") }}</label>
                                <input type="date" name="date_from" id="date_from" class="form-control" value="{{ request()->input('date_from') }}">
                            </div>
                            <div class="col-md-3">
                                <label for="date_to" class="form-label">{{ __("结束日期") }}</label>
                                <input type="date" name="date_to" id="date_to" class="form-control" value="{{ request()->input('date_to') }}">
                            </div>
                            <div class="col-md-12 text-end mt-3">
                                <button type="submit" class="btn btn-primary">{{ __("搜索") }}</button>
                                <a href="{{ route('user.virtual.card.transactions') }}" class="btn btn-secondary">{{ __("重置") }}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- 交易记录表格 -->
        <div class="col-12">
            <div class="card shadow-sm rounded-12">
                <div class="card-body">
                    @if($transactions->count() > 0)
                        @include('user.components.transaction-table', [
                            'transactions' => $transactions,
                            // 如果需要额外的表头和列，可以添加 'extraHeaders' 和 'extraColumns' 参数
                        ])
                        <!-- 分页 -->
                        <div class="d-flex justify-content-end">
                            {{ $transactions->withQueryString()->links('vendor.pagination.bootstrap-4') }}
                        </div>
                    @else
                        <p class="text-center my-5">{{ __("没有交易记录") }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @include('user.partials.footer')
</div>
@endsection 