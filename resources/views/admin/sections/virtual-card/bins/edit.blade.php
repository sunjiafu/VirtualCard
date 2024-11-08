@extends('admin.layouts.master')

@section('content')
<div class="card">
    <div class="card-header">
        <h5 class="card-title">{{ __("编辑卡段") }}</h5>
    </div>
    <div class="card-body">
        <form action="{{ route('admin.virtual.card.bins.update', $bin->id) }}" method="POST">
            @csrf
            @method('PUT')
            
            <div class="mb-3">
                <label class="form-label">{{ __("卡段") }}</label>
                <input type="text" name="bin" class="form-control" value="{{ $bin->bin }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">{{ __("地区") }}</label>
                <input type="text" name="region" class="form-control" value="{{ $bin->region }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">{{ __("卡片类型") }}</label>
                <input type="text" name="card_type" class="form-control" value="{{ $bin->card_type }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">{{ __("币种") }}</label>
                <input type="text" name="currency" class="form-control" value="{{ $bin->currency }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">{{ __("说明") }}</label>
                <textarea name="description" class="form-control" rows="3">{{ $bin->description }}</textarea>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-primary">{{ __("保存") }}</button>
                <a href="{{ route('admin.virtual.card.bins') }}" class="btn btn-secondary">{{ __("返回") }}</a>
            </div>
        </form>
    </div>
</div>
@endsection 