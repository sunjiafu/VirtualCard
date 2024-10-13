@extends('admin.layouts.master')

@section('page-title')
    @include('admin.components.page-title', ['title' => __('Manage Virtual Cards')])
@endsection

@section('breadcrumb')
    @include('admin.components.breadcrumb', ['breadcrumbs' => [
        ['name' => __("Dashboard"), 'url' => setRoute("admin.dashboard")],
        ['name' => __("Manage Virtual Cards"), 'url' => ''],
    ]])
@endsection

@section('content')
<div class="card">
    <div class="card-header">
        <h5 class="card-title mb-0">{{ __("虚拟卡搜索") }}</h5>
    </div>
    <div class="card-body">
        <form action="{{ route('admin.virtual.card.search') }}" method="GET" class="mb-4">
            <div class="row g-3 align-items-center">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                        <input type="text" name="search" class="form-control" placeholder="搜索用户名或卡号" value="{{ $search }}">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                        <input type="date" name="start_date" class="form-control" placeholder="开始日期" value="{{ $start_date ?? '' }}">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                        <input type="date" name="end_date" class="form-control" placeholder="结束日期" value="{{ $end_date ?? '' }}">
                    </div>
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary me-2">
                        <i class="fas fa-search me-1"></i> 搜索
                    </button>
                    <a href="{{ route('admin.virtual.card.show') }}" class="btn btn-secondary">
                        <i class="fas fa-undo me-1"></i> 清除筛选
                    </a>
                </div>
            </div>
        </form>

        @if($search || $start_date || $end_date)
            <div class="alert alert-info" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                当前搜索条件：
                @if($search) 关键词 "{{ $search }}" @endif
                @if($start_date) 从 {{ $start_date }} @endif
                @if($end_date) 到 {{ $end_date }} @endif
            </div>
        @endif

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-light">
                    <tr>
                        <th>{{ __("ID") }}</th>
                        <th>{{ __("用户") }}</th>
                        <th>{{ __("金额") }}</th>
                        <th>{{ __("卡号前缀") }}</th>
                        <th>{{ __("状态") }}</th>
                        <th>{{ __("创建时间") }}</th>
                        <th>{{ __("操作") }}</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($cards as $card)
                        <tr>
                            <td>{{ $card->id }}</td>
                            <td>{{ $card->user->username }}</td>
                            <td>{{ $card->amount }}</td>
                            <td>{{ $card->card_bin }}</td>
                            <td>
                                @if($card->is_active)
                                    <span class="badge bg-success">{{ __('激活') }}</span>
                                @else
                                    <span class="badge bg-danger">{{ __('未激活') }}</span>
                                @endif
                            </td>
                            <td>{{ $card->created_at->format('Y-m-d H:i:s') }}</td>
                            <td>
                                <a href="{{ route('admin.virtual.card.editcard', $card->id) }}" class="btn btn-sm btn-primary">
                                    <i class="fas fa-edit"></i> {{ __("编辑") }}
                                </a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center">{{ __("没有找到虚拟卡。") }}</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-center mt-4">
            {{ $cards->appends(['search' => $search, 'start_date' => $start_date, 'end_date' => $end_date])->links() }}
        </div>
    </div>
</div>
@endsection
