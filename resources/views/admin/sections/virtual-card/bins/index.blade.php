@extends('admin.layouts.master')

@section('page-title')
    @include('admin.components.page-title', ['title' => __('管理卡段')])
@endsection

@section('breadcrumb')
    @include('admin.components.breadcrumb', ['breadcrumbs' => [
        ['name' => __("Dashboard"), 'url' => setRoute("admin.dashboard")],
        ['name' => __("管理卡段"), 'url' => ''],
    ]])
@endsection

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="card-title mb-0">{{ __("卡段管理") }}</h5>
        <a href="{{ route('admin.virtual.card.bins.create') }}" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>{{ __("添加卡段") }}
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-light">
                    <tr>
                        <th>{{ __("ID") }}</th>
                        <th>{{ __("卡段") }}</th>
                        <th>{{ __("地区") }}</th>
                        <th>{{ __("卡片类型") }}</th>
                        <th>{{ __("币种") }}</th>
                        <th>{{ __("说明") }}</th>
                        <th>{{ __("操作") }}</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($bins as $bin)
                        <tr>
                            <td>{{ $bin->id }}</td>
                            <td>{{ $bin->bin }}</td>
                            <td>{{ $bin->region }}</td>
                            <td>{{ $bin->card_type }}</td>
                            <td>{{ $bin->currency }}</td>
                            <td>{{ $bin->description }}</td>
                            <td>
                                <a href="{{ route('admin.virtual.card.bins.edit', $bin->id) }}" 
                                   class="btn btn-sm btn-primary">
                                    <i class="fas fa-edit"></i> {{ __("编辑") }}
                                </a>
                                
                                <form action="{{ route('admin.virtual.card.bins.destroy', $bin->id) }}" 
                                      method="POST" 
                                      style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" 
                                            class="btn btn-sm btn-danger" 
                                            onclick="return confirm('确定要删除这个卡段吗？')">
                                        <i class="fas fa-trash"></i> {{ __("删除") }}
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center">{{ __("没有找到卡段记录") }}</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-center mt-4">
            {{ $bins->links() }}
        </div>
    </div>
</div>
@endsection 