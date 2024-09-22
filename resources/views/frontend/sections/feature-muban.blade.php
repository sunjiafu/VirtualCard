@php
    $lang = selectedLang();
    $feature_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::OUR_FEATURE);
    $feature = App\Models\Admin\SiteSections::getData( $feature_slug)->first();
@endphp
 <!-- ====== Features Start ====== -->
 <section id="features" class="ud-features">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="ud-section-title">
            <span>{{ __(@$feature->value->language->$lang->heading) }}</span>
            <h2>{{ __(@$feature->value->language->$lang->sub_heading) }}</h2>
            <p>
                {{ __(@$feature->value->language->$lang->details) }}
            </p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-xl-3 col-lg-3 col-sm-6">
          <div class="ud-single-feature wow fadeInUp" data-wow-delay=".1s">
            <div class="ud-feature-icon">
              <i class="lni lni-bullhorn"></i>
            </div>
            <div class="ud-feature-content">
              <h3 class="ud-feature-title">广告付费</h3>
              <p class="ud-feature-desc">
                支持各平台广告费用支付，如FaceBook、Tiktok、GoogleAds等平台推广费用.
              </p>
             
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-3 col-sm-6">
          <div class="ud-single-feature wow fadeInUp" data-wow-delay=".15s">
            <div class="ud-feature-icon">
              <i class="lni lni-cart"></i>
            </div>
            <div class="ud-feature-content">
              <h3 class="ud-feature-title">电商消费</h3>
              <p class="ud-feature-desc">
                Amazon、Ebay、速卖通、DHgate、Paypal等各类电商平台、品牌独立站订单付款.
              </p>
            
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-3 col-sm-6">
          <div class="ud-single-feature wow fadeInUp" data-wow-delay=".2s">
            <div class="ud-feature-icon">
              <i class="lni lni-gift"></i>
            </div>
            <div class="ud-feature-content">
              <h3 class="ud-feature-title">游戏储值</h3>
              <p class="ud-feature-desc">
                Google Play、Apple Store、Stem等各游戏平台储值及礼品卡购买.
              </p>
           
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-lg-3 col-sm-6">
          <div class="ud-single-feature wow fadeInUp" data-wow-delay=".25s">
            <div class="ud-feature-icon">
              <i class="lni lni-layers"></i>
            </div>
            <div class="ud-feature-content">
              <h3 class="ud-feature-title">付费订阅</h3>
              <p class="ud-feature-desc">
                Youtube、ChatGPT、Midjourney、Canva、Adobe等订阅会员付费.
              </p>
              
            </div>
          </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
              <a href="#more" class="ud-main-btn">{{__("Start Now")}}</a>
            </div>
          </div>
      </div>
   
    </div>
  </section>
  <!-- ====== Features End ====== -->