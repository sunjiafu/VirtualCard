
@php
    $lang = selectedLang();
    $about_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::ABOUT_SECTION);
    $about_sections = App\Models\Admin\SiteSections::getData( $about_slug)->first();
@endphp
<!-- ====== About Start ====== -->
<section id="about" class="ud-about">
    <div class="container">
      <div class="ud-about-wrapper wow fadeInUp" data-wow-delay=".2s">
        <div class="ud-about-content-wrapper">
          <div class="ud-about-content">
            <span class="tag">{{ __(@$about_sections->value->language->$lang->section_title) }}</span>
            <h2>{{ __(@$about_sections->value->language->$lang->heading) }}</h2>
            <p>
                {{ __(@$about_sections->value->language->$lang->sub_heading) }}
            </p>

            <div id="about" class="about-item pt-4">
                <div class="row">
                    @if(isset($about_sections->value->items))
                    @foreach($about_sections->value->items ?? [] as $key => $item)
                    <div class="col-lg-6">
                        <div class="item d-flex">
                            <div class="item-icon">
                                <i class="{{ @$item->language->$lang->icon }}"></i>
                            </div>
                            <div class="item-name">
                                <P>{{ __(@$item->language->$lang->title )}}</P>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    @endif
                   
                </div>
            </div>

            <a href="javascript:void(0)" class="ud-main-btn">{{__("Start Now")}}</a>
          </div>
          
        </div>
        <div class="ud-about-image">
          <img src="{{ get_image(@$about_sections->value->images->image,'site-section') }}" alt="about-image" />
        </div>
      </div>
    </div>
  </section>
  <!-- ====== About End ====== -->