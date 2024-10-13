 
 @extends('frontend.layouts.master_muban')
 @php
     $lang = selectedLang();
     $contact_slug = Illuminate\Support\Str::slug(App\Constants\SiteSectionConst::CONTACT_SECTION);
     $contact_sections = App\Models\Admin\SiteSections::getData( $contact_slug)->first();
 @endphp

     <!-- ====== Banner Start ====== -->
     <section class="ud-page-banner">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <div class="ud-banner-content">
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- ====== Banner End ====== -->
 @section('content')
 <!-- ====== Contact Start ====== -->
 <section id="contact" class="ud-contact">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-xl-8 col-lg-7">
          <div class="ud-contact-content-wrapper">
            <div class="ud-contact-title">
              <span>{{ __(@$contact_sections->value->language->$lang->title) }}</span>
              <h2>
                {{ __(@$contact_sections->value->language->$lang->heading) }}
              </h2>
            </div>
            <div class="ud-contact-info-wrapper">
              <div class="ud-single-info">
                <div class="ud-info-icon">
                  <i class="lni lni-telegram"></i>
                </div>
                <div class="ud-info-meta">
                  <h5>{{ __("Teregram") }}</h5>
                  {{ __(@$contact_sections->value->language->$lang->phone) }}
                </div>
              </div>
              <div class="ud-single-info">
                <div class="ud-info-icon">
                  <i class="lni lni-envelope"></i>
                </div>
                <div class="ud-info-meta">
                  <h5>{{ __("Email Address") }}</h5>
                  {{ __(@$contact_sections->value->language->$lang->email) }}

                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-lg-5">
          <div
            class="ud-contact-form-wrapper wow fadeInUp"
            data-wow-delay=".2s"
          >
            <h3 class="ud-contact-form-title">Send us a Message</h3>
            <form class="ud-contact-form" action="{{ setRoute('contact.store') }}"  method="POST" id="ud-contact-form">
              <div class="ud-form-group">
                <label for="fullName">{{ __("Name") }}*</label>
                <input type="text" name="name" class="form--control" placeholder="{{ __("enter Name") }}" required>

              </div>
              <div class="ud-form-group">
                <label>{{ __("Email") }}<span>*</span></label>
                <input type="email" name="email" class="form--control" placeholder="{{ __("enter Email Address") }}" required>

              </div>
              <div class="ud-form-group">
                <label>{{ __("Phone") }}<span>*</span></label>
                <input type="number" name="mobile" class="form--control" placeholder="{{ __("Enter Phone") }}" required>
              </div>
              <div class="ud-form-group">
                <label>{{ __("Subject") }}<span>*</span></label>
                <input type="text" name="subject" class="form--control" placeholder="{{ __("Enter Subject") }}" required>
              </div>
              <div class="ud-form-group">
                <label>{{ __("Message") }}<span>*</span></label>
                                <textarea class="form--control" name="message" placeholder="{{ __("Write Here") }}" required></textarea>
              </div>
              <div class="ud-form-group mb-0">
                <button type="submit" class="ud-main-btn">
                    {{ __("Send Message") }}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ====== Contact End ====== -->

  @endsection
@push('script')
<script>

    //*************** Contact Form Submit Start ******************
    $(document).on('submit', '#ud-contact-form', function(e){
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "{{ setRoute('contact.store') }}",
            data: new FormData(this),
            dataType: "json",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function(){
                $('#ud-contact-form .fa-spinner').removeClass('d-none');
            },
            complete: function(){
                $('#ud-contact-form .fa-spinner').addClass('d-none');
            },
            success: function (data) {
                $('#ud-contact-form')[0].reset();
                throwMessage('success', data.message.success);
                setTimeout(() => {
                    location.reload();
                }, 1000);
            },
            error: function(xhr, ajaxOption, thrownError){
                try {
                    // 尝试解析 JSON 响应
                    var errorObj = JSON.parse(xhr.responseText);
                    
                    // 检查 errors 属性是否存在并且是对象或数组
                    if (errorObj.message && errorObj.message.error && errorObj.message.error.errors) {
                        // 如果是对象或数组，传给 throwMessage
                        throwMessage('error', errorObj.message.error.errors);
                    } else {
                        // 如果 errors 是字符串或 undefined，传入一个数组
                        throwMessage('error', ['An unknown error occurred. Please try again later.']);
                    }
                } catch (e) {
                    // 如果解析错误或 responseText 格式不正确，传入通用的错误信息数组
                    throwMessage('error', ['An error occurred. Please try again.']);
                }

                setTimeout(() => {
                    location.reload();
                }, 1000);
            },
        });
    });
    //*************** Contact Form Submit End ******************

    //*************** Error Message Handling ******************
    function throwMessage(type, messages) {
        // 如果 messages 是字符串，则转换为数组
        if (typeof messages === 'string') {
            messages = [messages];
        }

        // 遍历 messages 数组，显示每个错误
        $.each(messages, function(index, msg) {
            console.error(type + ': ' + msg);
            // 可以在这里将错误显示在页面上
            // 例如：$('#error-message').append('<p>' + msg + '</p>');
        });
    }
    //*************** Error Message Handling End ******************

</script>

@endpush

