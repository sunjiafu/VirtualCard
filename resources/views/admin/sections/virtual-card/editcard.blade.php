@extends('admin.layouts.master')

@section('page-title')
    @include('admin.components.page-title', ['title' => __('Edit Virtual Card')])
@endsection

@section('breadcrumb')
    @include('admin.components.breadcrumb', ['breadcrumbs' => [
        ['name' => __("Dashboard"), 'url' => setRoute("admin.dashboard")],
        ['name' => __("Manage Virtual Cards"), 'url' => route('admin.virtual.card.show')],
        ['name' => __("Edit Virtual Card"), 'url' => ''],
    ]])
@endsection

@section('content')
<div class="custom-card">
    <div class="card-header">
        <h6 class="title">{{ __("Edit Virtual Card") }}</h6>
    </div>
    <div class="card-body">
        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
        <form action="{{ route('admin.virtual.card.update', $card->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-group">
                <label for="cardPan">{{ __("Card Number") }}</label>
                <input type="text" class="form-control" id="cardPan" name="card_pan" value="{{ old('card_pan', $card->card_pan) }}" required>
            </div>
            <div class="form-group">
                <label for="cardPan">{{ __("expiration") }}</label>
                <input type="text" class="form-control" id="cardPan" name="expiration" value="{{ old('expiration', $card->expiration) }}" required>
            </div>
            <div class="form-group">
                <label for="cvv">{{ __("CVV") }}</label>
                <input type="text" class="form-control" id="cvv" name="cvv" value="{{ old('cvv', $card->cvv) }}" required>
            </div>
            <div class="form-group">
                <label for="cvv">{{ __("Holder Name") }}</label>
                <input type="text" class="form-control" id="name_on_card" name="name_on_card" value="{{ old('cvv', $card->name_on_card) }}" required>
            </div>
            <div class="form-group">
                <label for="cvv">{{ __("Card_type") }}</label>
                <input type="text" class="form-control" id="card_type" name="card_type" value="{{ old('card_type', $card->card_type) }}" required>
            </div>
            <div class="form-group">
                <label for="city">{{ __("City") }}</label>
                <input type="text" class="form-control" id="city" name="city" value="{{ old('city', $card->city) }}" required>
            </div>
            <div class="form-group">
                <label for="state">{{ __("State") }}</label>
                <input type="text" class="form-control" id="state" name="state" value="{{ old('state', $card->state) }}" required>
            </div>
            <div class="form-group">
                <label for="state">{{ __("Address") }}</label>
                <input type="text" class="form-control" id="address" name="address" value="{{ old('address', $card->address) }}" required>
            </div>
            <div class="form-group">
                <label for="state">{{ __("Zip_code") }}</label>
                <input type="text" class="form-control" id="zip_code" name="zip_code" value="{{ old('zip_code', $card->zip_code) }}" required>
            </div>
            <div class="form-group">
                <label for="isActive">{{ __("Status") }}</label>
                <select id="isActive" name="is_active" class="form-control">
                    <option value="1" {{ $card->is_active ? 'selected' : '' }}>{{ __("Active") }}</option>
                    <option value="0" {{ !$card->is_active ? 'selected' : '' }}>{{ __("Inactive") }}</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">{{ __("Save Changes") }}</button>
        </form>
    </div>
</div>
@endsection
