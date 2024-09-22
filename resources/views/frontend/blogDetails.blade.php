@extends('frontend.layouts.master_muban')

@php
    $lang = selectedLang();
@endphp

@section('content')
    <!-- ====== Banner Start ====== -->
    <section class="ud-page-banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ud-banner-content">
                        <h1>{{__("Blog Page")}}</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ====== Banner End ====== -->


    <!-- ====== Blog Details Start ====== -->
    <section class="ud-blog-details mb-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ud-blog-details-image">
                        <img src="{{ get_image(@$blog->image, 'blog') }}" alt="blog details" />
                        <div class="ud-blog-overlay">
                            <div class="ud-blog-overlay-content">
                                <div class="ud-blog-author">
                                    <img src="{{ asset('public/frontend/images/logo/logo.png') }}" alt="author" />
                                    <span>
                                        By <a href="{{ route('index') }}"> VelxPay </a>
                                    </span>
                                </div>

                                <div class="ud-blog-meta">
                                    <p class="date">
                                        <i class="lni lni-calendar"></i>
                                        <span>{{ $blog->created_at->format('y-m-d') }}</span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="ud-blog-details-content">
                        <h2 class="ud-blog-details-title">
                            {{ @$blog->name->language->$lang->name }} </h2>
                            @php
                                echo @$blog->details->language->$lang->details;
                            @endphp

                      

                        <div class="ud-blog-details-action">


                            <ul class="ud-blog-tags mt-4">
                                @foreach ($blog->tags as $tag)
                                    <li>
                                        <a href="javascript:void(0)">{{ @$tag }}</a>
                                    </li>
                                @endforeach
                            </ul>

                            <div class="ud-blog-share">
                                <h6>{{ __('Share This Post') }}</h6>
                                <ul class="ud-blog-share-links">
                                    <li>
                                        <a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode(url()->current()) }}"
                                            class="facebook" target="_blank">
                                            <i class="lni lni-facebook-filled"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://twitter.com/intent/tweet?url={{ urlencode(url()->current()) }}&text=  {{ @$blog->name->language->$lang->name }}"
                                            class="twitter" target="_blank">
                                            <i class="lni lni-twitter-filled"></i>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="ud-blog-sidebar">
                        <div class="ud-newsletter-box">
                            <img src="{{ asset('public/frontend/images/blog/dotted-shape.svg') }}" alt="shape"
                                class="shape shape-1" />
                            <img src="{{ asset('public/frontend/images/blog/dotted-shape.svg') }}" alt="shape"
                                class="shape shape-2" />
                            <h3 class="ud-newsletter-title">{{ __('Join our Telegram Channel!') }}</h3>
                            <p>{{ __('Follow our Telegram channel to receive the latest updates.') }}</p>
                            <form class="ud-newsletter-form">
                                <!-- 移除输入框 -->
                                <a href="https://t.me/YourTelegramChannel" target="_blank" class="ud-main-btn">
                                    {{ __('Join Now') }}
                                </a>

                        </div>

                        {{-- 热门文章 --}}
                        <div class="ud-articles-box">
                            <h3 class="ud-articles-box-title">{{ __('Popular Articles') }}</h3>
                            @foreach ($recentPost as $post)
                                <ul class="ud-articles-list">
                                    <li>
                                        <div class="ud-article-image">
                                            <a href="{{ route('blog.details', [$post->id, @$post->slug]) }}">
                                                <img src="{{ get_image(@$post->image, 'blog') }}"
                                                    alt=" {{ @$post->name->language->$lang->name }}" />
                                            </a>
                                        </div>
                                        <div class="ud-article-content">
                                            <h5 class="ud-article-title">
                                                <a href="{{ route('blog.details', [$post->id, @$post->slug]) }}">
                                                    {{ @$post->name->language->$lang->name }}
                                                </a>
                                            </h5>
                                            <span class="ud-blog-date">{{ $post->created_at->diffForHumans() }}</span>
                                        </div>
                                    </li>
                            @endforeach

                            </ul>
                        </div>
                        <div class="ud-banner-ad">
                            <a href="javascript:void(0)">
                                <img src="assets/images/blog/bannder-ad.png" alt="ad banner" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ====== Blog Details End ====== -->

    <!-- ====== Blog Start ====== -->

    <!-- ====== Blog End ====== -->
@endsection

@push('script')
@endpush
