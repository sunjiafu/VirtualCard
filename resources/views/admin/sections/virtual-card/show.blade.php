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
<div class="custom-card">
    <div class="card-header">
        <h6 class="title">{{ __("Virtual Cards") }}</h6>
    </div>
    <div class="card-body">
        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>{{ __("ID") }}</th>
                    <th>{{ __("User") }}</th>
                    <th>{{ __("Amount") }}</th>
                    <th>{{__("CardBin")}}</th>
                    <th>{{ __("Status") }}</th>
                   
                    <th>{{ __("Actions") }}</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($cards as $card)
                    <tr>
                        <td>{{ $card->id }}</td>
                        <td>{{ $card->user->fullname }}</td>
                        <td>{{ $card->amount }}</td>
                        <td>{{ $card->card_bin }}</td>
                        <td>{{ $card->is_active ? __('Active') : __('Inactive') }}</td>
                        <td>
                            <a href="{{ route('admin.virtual.card.editcard', $card->id) }}" class="btn btn-sm btn-secondary">
                                {{ __("Edit") }}
                            </a>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="5" class="text-center">{{ __("No virtual cards found.") }}</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
