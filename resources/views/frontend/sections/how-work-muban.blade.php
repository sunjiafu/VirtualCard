@php
    $lang = selectedLang();
    $work_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::WORK_SECTION);
    $work = App\Models\Admin\SiteSections::getData($work_slug)->first();
@endphp

<!-- ====== Pricing Start ====== -->
<section id="pricing" class="ud-pricing">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="ud-section-title mx-auto text-center">
                    <span>{{ __(@$work->value->language->$lang->title) }}</span>
                    <h2>{{ __(@$work->value->language->$lang->sub_title) }}</h2>
                   
                </div>
            </div>
        </div>

        <div class="row g-0 align-items-center justify-content-center">

           {{-- how does it work start --}}


           <div class="row text-center wow fadeInUp" data-wow-delay=".15s"
           >
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card border-0 shadow">
                    <div class="card-body">
                        <div class="icon-box bg-primary text-white rounded-circle mb-4 mx-auto" style="width: 70px; height: 70px; display: flex; align-items: center; justify-content: center;">
                            <i class="lni lni-user" style="font-size: 30px;"></i>
                        </div>
                        <h5 class="card-title">{{__('Sign Up')}}</h5>
                        <p class="card-text">{{__('Begin by signing up on the StripCard platform. Provide the required information to create your account.')}}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card border-0 shadow">
                    <div class="card-body">
                        <div class="icon-box bg-primary text-white rounded-circle mb-4 mx-auto" style="width: 70px; height: 70px; display: flex; align-items: center; justify-content: center;">
                            <i class="lni lni-credit-cards" style="font-size: 30px;"></i>
                        </div>
                        <h5 class="card-title">{{__('Add Payment')}}</h5>
                        <p class="card-text">{{__("This can be done through various payment methods, ensuring flexibility and convenience.")}}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card border-0 shadow">
                    <div class="card-body">
                        <div class="icon-box bg-primary text-white rounded-circle mb-4 mx-auto" style="width: 70px; height: 70px; display: flex; align-items: center; justify-content: center;">
                            <i class="lni lni-checkmark-circle" style="font-size: 30px;"></i>
                        </div>
                        <h5 class="card-title">{{__('Apply Virtual Card')}}</h5>
                        <p class="card-text">{{__('It mirrors your traditional credit card, allowing you to conduct online transactions securely')}}</p>
                    </div>
                </div>
            </div>


           <!-- how does it work over -->
           
        </div>
    </div>
        </div>
    </div>
</section>
<!-- ====== Pricing End ====== -->
{{-- <section class="how-it-works-section ptb-80">
    <div class="container">
        <div class="row how-it-works-wrapper justify-content-center">
            <div class="how-its-work-title pb-5">
                <span class="text--base"> {{ __(@$work->value->language->$lang->title) }}</span>
                <h2 class="title pt-2">{{ __(@$work->value->language->$lang->sub_title) }}</h2>
            </div>
            @if (isset($work->value->items))
            @php
                $num =0
            @endphp
            @foreach ($work->value->items ?? [] as $key => $item)
            @php
                $num += 1;
            @endphp
            <div class="col-xl-4 col-lg-4 col-md-4">
                <div class="how-it-work-number">
                    <span>0{{  @$num }}</span>
                </div>
                <div class="how-it-work-area">
                    <div class="how-it-work-icon">
                        <i class="{{ @$item->language->$lang->icon }}"></i>
                    </div>
                    <div class="how-it-work-title">
                        <h3 class="title">{{ @$item->language->$lang->name }}</h3>
                        <p>{{ @$item->language->$lang->details }}</p>
                    </div>
                </div>
            </div>
            @endforeach
            @endif

        </div>
    </div>
</section> --}}
