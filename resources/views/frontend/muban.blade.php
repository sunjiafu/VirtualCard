@extends('frontend.layouts.master_muban')
@php
    $lang = selectedLang();
    $banner_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::HOME_BANNER);
    $banner = App\Models\Admin\SiteSections::getData($banner_slug)->first();

@endphp

@section('content')
    <section class="ud-hero" id="home">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ud-hero-content wow fadeInUp" data-wow-delay=".2s">
                        @php
                            $heading = explode(' ', @$banner->value->language->$lang->heading);

                        @endphp
                        <h1 class="ud-hero-title">
                            {{ @$heading[0] }} {{ @$heading[1] }} {{ @$heading[2] }} {{ @$heading[4] }} <span
                                class="text--base"> {{ @$heading[5] }} {{ @$heading[6] }}</span> {{ @$heading[7] }} </h1>
                        <p class="ud-hero-desc">
                            {{ __(key: @$banner->value->language->$lang->sub_heading) }}</p>

                        <ul class="ud-hero-buttons">
                            <li>
                                <a href="https://links.uideck.com/play-bootstrap-download" rel="nofollow noopener"
                                    target="_blank" class="ud-main-btn ud-white-btn">
                                    {{ __('Start Now') }} </a>
                            </li>
                        </ul>
                    </div>
                    {{-- <div class="ud-hero-brands-wrapper wow fadeInUp" data-wow-delay=".3s">
                        <img src="{{ asset('public/frontend/images/element/brand.png') }}" alt="brand" />
                    </div> --}}
                    <div class="ud-hero-image wow fadeInUp" data-wow-delay=".25s">
                        <img src="{{ get_image(@$banner->value->images->banner_image, 'site-section') }}" alt="hero-image" />
                        <img src="{{ asset('public/frontend/images/hero/dotted-shape.svg') }}" alt="shape"
                            class="shape shape-1" />
                        <img src="{{asset('public/frontend/images/hero/dotted-shape.svg')}}" alt="shape" class="shape shape-2" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    {{-- feature start --}}
@include('frontend.sections.feature-muban')
{{--About Start --}}
@include('frontend.sections.about-muban')
{{--how-work-start--}}
@include('frontend.sections.how-work-muban')

{{--FAQ Start--}}
@include('frontend.sections.faq')
@endsection




@push("script")

@endpush