@extends('admin.layouts.master')

@push('css')

@endpush

@section('breadcrumb')
    @include('admin.components.breadcrumb', [
        'breadcrumbs' => [
            ['name' => __("Dashboard"), 'url' => setRoute("admin.dashboard")],
            ['name' => __("Virtual Card Transactions"), 'url' => '#'],
        ],
        'active' => __("Find Virtual Card")
    ])
@endsection

@section('content')
<div class="body-wrapper">
    <div class="dashboard-area mt-10">
        <div class="dashboard-header-wrapper">
            <h3 class="title">{{ __(@$page_title) }}</h3>
        </div>
    </div>
    
    <div class="dashboard-list-area mt-20">
        <div class="dashboard-list-wrapper">
            <!-- 搜索卡号表单 -->
            <form action="{{ route('admin.virtual.card.trc') }}" method="GET" class="card-form row g-4 mb-4">
                <div class="col-12">
                    <div class="form-group">
                        <label for="card_pan">{{ __("Card Number") }}</label>
                        <input type="text" name="card_pan" id="card_pan" class="form--control" placeholder="{{ __("Enter Card Number") }}" required>
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn--base w-100">{{ __("Find Card") }}</button>
                </div>
            </form>

            @if(isset($card))
            <div class="card-wrapper p-4">
                <h4 class="text--base mb-3">{{ __("Card Details") }}</h4>
                <p><strong>{{ __("Card Number:") }}</strong> {{ $card->card_pan }}</p>
                <p><strong>{{ __("Card Holder:") }}</strong> {{ $card->card_holder }}</p>
                <p><strong>{{ __("Expiration:") }}</strong> {{ date('m/Y', strtotime($card->expiration)) }}</p>

                <form action="{{ route('admin.virtual.card.store') }}" method="POST" class="mt-4">
    @csrf
    <input type="hidden" name="card_id" value="{{ $card->id }}">

    <h4 class="text--base mb-3">{{ __("Add Transaction") }}</h4>

    <div class="form-group">
        <label for="amount">{{ __("Amount") }}</label>
        <input type="number" name="amount" id="amount" class="form--control" required>
    </div>
    <div class="form-group">
        <label for="currency">{{ __("Currency") }}</label>
        <input type="text" name="currency" id="currency" class="form--control" required>
    </div>
    <div class="form-group">
        <label for="status">{{ __("Status") }}</label>
        <input type="text" name="status" id="status" class="form--control" required>
    </div>
    <div class="form-group">
        <label for="product">{{ __("Product (optional)") }}</label>
        <input type="text" name="product" id="product" class="form--control">
    </div>
    <div class="form-group">
        <label for="reference">{{ __("Reference (optional)") }}</label>
        <input type="text" name="reference" id="reference" class="form--control">
    </div>
    <div class="form-group">
        <label for="gateway_reference">{{ __("Gateway Reference (optional)") }}</label>
        <input type="text" name="gateway_reference" id="gateway_reference" class="form--control">
    </div>
    <div class="form-group">
        <label for="response_message">{{ __("Response Message (optional)") }}</label>
        <input type="text" name="response_message" id="response_message" class="form--control">
    </div>

    <button type="submit" class="btn--base w-100">{{ __("Add Transaction") }}</button>
</form>

            </div>

            <h4 class="text--base mt-5">{{ __("Existing Transactions") }}</h4>
            <div class="dashboard-list-wrapper">
                <table class="table">
                    <thead>
                        <tr>
                            <th>{{ __("ID") }}</th>
                            <th>{{ __("Amount") }}</th>
                            <th>{{ __("Currency") }}</th>
                            <th>{{ __("Status") }}</th>
                            <th>{{ __("Product") }}</th>
                            <th>{{ __("Reference") }}</th>
                            <th>{{ __("Gateway Reference") }}</th>
                            <th>{{ __("Response Message") }}</th>
                            <th>{{ __("Date") }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($transactions as $transaction)
                        <tr>
                            <td>{{ $transaction->id }}</td>
                            <td>{{ $transaction->amount }}</td>
                            <td>{{ $transaction->currency }}</td>
                            <td>{{ $transaction->status }}</td>
                            <td>{{ $transaction->product }}</td>
                            <td>{{ $transaction->reference }}</td>
                            <td>{{ $transaction->gateway_reference }}</td>
                            <td>{{ $transaction->response_message }}</td>
                            <td>{{ $transaction->created_at }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            @else
            <div class="alert alert-primary text-center">
                {{ __("No Record Found!") }}
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

@push('script')

@endpush
