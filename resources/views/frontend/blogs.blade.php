@extends('frontend.layouts.master_muban')

@php
    $lang = selectedLang();
    $blog_section_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::BLOG_SECTION);
    $blog_section = App\Models\Admin\SiteSections::getData( $blog_section_slug)->first();

@endphp

@section('content')

    <!-- ====== Banner Start ====== -->
    <section class="ud-page-banner">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="ud-banner-content">
                <h1>Blog Page</h1>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- ====== Banner End ====== -->

 <!-- ====== Blog Start ====== -->
 <section class="ud-blog-grids">

    <div class="container">
      <div class="row">
        @foreach ($blogs??[] as $blog)

        <div class="col-lg-4 col-md-6">
          <div class="ud-single-blog">
            <div class="ud-blog-image">
              <a href="{{route('blog.details',[$blog->id,$blog->slug])}}">
                <img src={{ get_image(@$blog->image,'blog') }} alt="blog" />
              </a>
            </div>
            <div class="ud-blog-content">
              <span class="ud-blog-date">{{showDate(@$blog->created_at)}}</span>
              <h3 class="ud-blog-title">
                <a href="{{route('blog.details',[$blog->id,$blog->slug])}}">
                    {{ @$blog->name->language->$lang->name }}                </a>
              </h3>
              <p class="ud-blog-desc">
                {{textLength(strip_tags(@$blog->details->language->$lang->details,120))}}

              </p>
            </div>
          </div>
        
        </div>

        @endforeach
      </div>

      <nav>
        <ul class="pagination">
            {{ get_paginate($blogs) }}
        </ul>
    </nav>
    </div>
  </section>
  <!-- ====== Blog End ====== -->
@endsection


@push("script")

@endpush
