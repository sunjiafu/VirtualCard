@extends('admin.layouts.master')

@section('page-title')
    @include('admin.components.page-title',['title' => __("Edit Virtual Card")])
@endsection

@section('breadcrumb')
    @include('admin.components.breadcrumb',['breadcrumbs' => [
        [
            'name'  => __("Dashboard"),
            'url'   => route("admin.dashboard"),
        ],
        [
            'name'  => __("Virtual Cards"),
            'url'   => route("admin.virtual_cards.show"),
        ]
    ], 'active' => __("Edit Virtual Card")])
@endsection

@section('content')
    <div class="custom-card">
        <div class="card-header">
            <h6 class="title">{{ __("Edit Virtual Card") }}</h6>
        </div>
        <div class="card-body">
            <form class="card-form" action="{{ route('admin.virtual_cards.update', $card->id) }}" method="POST">
                @csrf
                @method("PUT")
                
                <!-- Card Number -->
                <div class="row mb-10-none">
                    <div class="col-xl-12 col-lg-12 form-group">
                        <label>{{ __("Card Number") }}*</label>
                        <input type="text" class="form--control" name="card_pan" value="{{ old('card_pan', $card->card_pan) }}" required>
                    </div>
                </div>
                
                <!-- CVV -->
                <div class="row mb-10-none">
                    <div class="col-xl-12 col-lg-12 form-group">
                        <label>{{ __("CVV") }}*</label>
                        <input type="text" class="form--control" name="cvv" value="{{ old('cvv', $card->cvv) }}" required>
                    </div>
                </div>
                
                <!-- Expiration Date -->
                <div class="row mb-10-none">
                    <div class="col-xl-12 col-lg-12 form-group">
                        <label>{{ __("Expiration Date") }}*</label>
                        <input type="date" class="form--control" name="expiration" value="{{ old('expiration', $card->expiration) }}" required>
                    </div>
                </div>

                <!-- Status -->
                <div class="row mb-10-none">
                    <div class="col-xl-12 col-lg-12 form-group">
                        <label>{{ __("Status") }}*</label>
                        <select class="form--control nice-select" name="is_active" required>
                            <option value="0" {{ $card->is_active ? '' : 'selected' }}>{{ __("Inactive") }}</option>
                            <option value="1" {{ $card->is_active ? 'selected' : '' }}>{{ __("Active") }}</option>
                        </select>
                    </div>
                </div>

                <!-- Update Button -->
                <div class="row mb-10-none">
                    <div class="col-xl-12 col-lg-12 form-group">
                        @include('admin.components.button.form-btn',[
                            'class'         => "w-100 btn-loading",
                            'text'          => __("Update"),
                            'permission'    => "admin.virtual_cards.update"
                        ])
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
