@php
    $type = App\Constants\GlobalConst::SETUP_PAGE;
    $menues = DB::table('setup_pages')->where('status', 1)->where('type', Str::slug($type))->get();
@endphp

<!-- ====== Header Start ====== -->
<!-- ====== Header Start ====== -->
<header class="ud-header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg bg-transparent">
                    <a class="navbar-brand" href="{{ setRoute('index') }}">
                        <img src="{{ get_logo($basic_settings) }}"
                            data-white_img="{{ get_logo($basic_settings, 'white') }}"
                            alt="site-logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="toggler-icon"> </span>
                        <span class="toggler-icon"> </span>
                        <span class="toggler-icon"> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul  class="navbar-nav mx-auto">
                            @php
                                $current_url = URL::current();
                            @endphp

                            @foreach ($menues as $item)
                                @php
                                    $title = json_decode($item->title);
                                @endphp
                                <li class="nav-item">
                                    <a class="ud-menu-scroll @if ($current_url == url($item->url)) active @endif"
                                        href="{{ url($item->url) }}">{{ __($title->title) }}</a>
                                </li>
                            @endforeach
                        </ul>

                        <!-- 修改 flex-column 类 -->
                        <div class="d-flex d-lg-flex flex-column flex-lg-row align-items-center">
                            @php
                                $session_lan = session('local') ?? get_default_language_code();
                            @endphp
                            <select class="form-select langSel me-3 mb-3 ">
                                @foreach ($__languages as $item)
                                    <option value="{{ $item->code }}" @if ($session_lan == $item->code) selected @endif>
                                        {{ $item->name }}</option>
                                @endforeach
                            </select>

                            @auth
                                @if (auth()->user()->email_verified == 0)
                                    <a href="{{setRoute('user.login')}}" class="ud-main-btn ud-login-btn mb-3">
                                        {{__("Sign In")}}
                                    </a>
                                @else
                                    <a href="{{ setRoute('user.dashboard') }}" class="ud-main-btn ud-white-btn mb-3">
                                        {{__("Dashboard")}}                               
                                         </a>
                                @endif
                            @else
                                <a class="ud-main-btn ud-white-btn mb-3" href="{{setRoute('user.login')}}">
                                    {{__("Sign In")}}
                                </a>
                            @endauth
                        </div>
                        <!-- 结束 -->
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>


    <!-- ====== Header End ====== -->

    <!-- ====== Hero Start ====== -->
