<!-- Muze Default Sidebar, Muze Navbar, Muze Navbar Vertical, Muze Navbar Expand Lg, Muze Navbar Light -->
<nav class="navbar navbar-vertical navbar-expand-lg navbar-light">
    <a class="navbar-brand mx-auto d-none d-lg-block my-0 my-lg-4" href="#">
      <img src="{{ get_logo($basic_settings,"dark") }}" alt="site-logo">
      <img src="{{ get_logo($basic_settings,"white") }}" alt="site-logo" class="white-logo2">
      <img src="{{ get_fav($basic_settings) }}" class="muze-icon" width="80" height="auto" alt="site-logo">
      <img src="{{ get_fav($basic_settings) }}" class="muze-icon-white" width="80" height="auto" alt="sit-logo">
    </a>
    <div class="navbar-collapse">
      <ul class="navbar-nav mb-2" id="accordionExample" data-simplebar>
        <li class="nav-item">
          <a class="nav-link" href="{{setRoute('user.dashboard')}}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
            </svg> &nbsp;<span class="ms-2">个人中心</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="#sidebarWallet" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarWallet">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
              <path d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
              <path d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z"/>
            </svg> &nbsp;<span class="ms-2">钱包</span>
          </a>
          <div class="collapse collapse-box" id="sidebarWallet" data-bs-parent="#accordionExample">
            <ul class="nav nav-sm flex-column">
              <li class="nav-item">
                <a href="{{setRoute('user.balance.management')}}" class="nav-link">余额管理</a>
              </li>
              <li class="nav-item">
                <a href="{{setRoute('user.add.money.index')}}" class="nav-link">充值</a>
              </li>
              <li class="nav-item">
                <a href="{{ setRoute('user.transfer.money.index') }}" class="nav-link">转账</a>
              </li>
              {{-- <li class="nav-item">
                <a href="withdraw.html" class="nav-link">提现</a>
              </li> --}}
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="#sidebarCard" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarCard">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
              <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
              <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
            </svg> &nbsp;<span class="ms-2">卡片管理</span>
          </a>
          <div class="collapse collapse-box" id="sidebarCard" data-bs-parent="#accordionExample">
            <ul class="nav nav-sm flex-column">
              <li class="nav-item">
                <a href="{{setRoute('user.virtual.card.add.card')}}" class="nav-link">申请卡片</a>
              </li>
              <li class="nav-item">
                <a href="{{setRoute('user.virtual.card.index')}}" class="nav-link">查询卡片</a>
              </li>
              <li class="nav-item">
                <a href="{{setRoute('user.virtual.card.transactions')}}" class="nav-link">交易记录</a>
              </li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{setRoute('user.profile.index')}}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
              <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
            </svg> &nbsp;<span class="ms-2">我的资料</span>
          </a>
        </li>
      </ul>
      <div class="navbar-vertical-footer border-top border-gray-50">
        <ul class="navbar-vertical-footer-list justify-content-end">
          <li class="dropup ms-auto">
            @php
                $session_lan = session('local') ?? get_default_language_code();
            @endphp
            <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas {{ $session_lan == 'zh' ? 'fa-language' : 'fa-globe' }} text-secondary"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" id="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <li class="dropdown-sub-title">
                <span>Language</span>
              </li>
              <select class="form-select langSel">
                  @foreach ($__languages as $item)
                      <option value="{{ $item->code }}" @if ($session_lan == $item->code) selected @endif>
                          {{ $item->name }}
                      </option>
                  @endforeach
              </select>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    
  </nav>

  @push('script')
 
  @endpush
