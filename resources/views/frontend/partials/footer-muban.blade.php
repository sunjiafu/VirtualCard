@php
    $lang = selectedLang();
    $footer_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::FOOTER_SECTION);
    $footer = App\Models\Admin\SiteSections::getData( $footer_slug)->first();
    $type =  Illuminate\Support\Str::slug(App\Constants\GlobalConst::USEFUL_LINKS);
    $policies = App\Models\Admin\SetupPage::orderBy('id')->where('type', $type)->where('status',1)->get();
@endphp

<!-- ====== Footer Start ====== -->
<footer class="ud-footer wow fadeInUp" data-wow-delay=".15s">
  <div class="shape shape-1">
    <img src="{{asset('public/frontend/images/footer/shape-1.svg')}}" alt="shape" />
  </div>
  <div class="shape shape-2">
    <img src="{{asset('public/frontend/images/footer/shape-2.svg')}}" alt="shape" />
  </div>
  <div class="shape shape-3">
    <img src="{{asset('public/frontend/images/footer/shape-3.svg')}}" alt="shape" />
  </div>
  
  <!-- Footer Widgets Section -->
  <div class="ud-footer-widgets">
    <div class="container">
      <div class="row">
        <!-- Logo and Company Description -->
        <div class="col-xl-4 col-lg-4 col-md-6">
          <div class="ud-widget">
            <a href="{{ setRoute('index') }}" class="ud-footer-logo">
              <img src="{{ get_logo($basic_settings) }}" data-white_img="{{ get_logo($basic_settings,'white') }}"
                   data-dark_img="{{ get_logo($basic_settings,'dark') }}" alt="logo" />
            </a>
            <p class="ud-widget-desc">
              我们通过技术为品牌和企业创造数字体验，帮助您更好地管理全球支付服务。
            </p>
            <ul class="ud-widget-socials">
              @if(isset($footer->value->items))
              @foreach($footer->value->items ?? [] as $key => $item)
              <li>
                <a href="{{ @$item->language->$lang->link }}" target="_blank">
                  <i class="{{ @$item->language->$lang->social_icon }}"></i>
                </a>
              </li>
              @endforeach
              @endif
            </ul>
          </div>
        </div>
        
        <!-- About Us and Links -->
        <div class="col-xl-4 col-lg-4 col-md-6">
          <div class="ud-widget">
            <h5 class="ud-widget-title">帮助中心</h5>
            <ul class="ud-widget-links">
             
              <li>
                <a href="javascript:void(0)">如何使用VelixPay虚拟卡平台？</a>
              </li>
              <li>
                <a href="javascript:void(0)">VelixPay费用说明</a>
              </li>
              <li>
                <a href="javascript:void(0)">支持的消费场景</a>
              </li>
            </ul>
          </div>
        </div>
        
        <!-- Privacy Policy and Useful Links -->
        {{-- <div class="col-xl-4 col-lg-4 col-md-6">
          <div class="ud-widget">
            <h5 class="ud-widget-title">重要链接</h5>
            <ul class="ud-widget-links">
              <li>
                <a href="javascript:void(0)">隐私政策</a>
              </li>
              <li>
                <a href="javascript:void(0)">支持政策</a>
              </li>
              <li>
                <a href="javascript:void(0)">服务条款</a>
              </li>
            </ul>
          </div>
        </div> --}}
      </div>
    </div>
  </div>
  
  <!-- Footer Bottom Section -->
  <div class="ud-footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <p class="ud-footer-bottom-right">
            © 2024 VelixPay. 保留所有权利 
          </p>
        </div>
      </div>
    </div>
  </div>

  <!-- Back to Top Button -->
  <a href="javascript:void(0)" class="back-to-top">
    <i class="lni lni-chevron-up"></i>
  </a>

  <!-- Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-5QT8DEH80J"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-5QT8DEH80J');
  </script>
</footer>
