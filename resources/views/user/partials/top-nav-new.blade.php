<div class="header border-bottom border-gray-200 header-fixed">
    <div class="container-fluid px-0">
      <div class="header-body px-3 px-xxl-5 py-3 py-lg-4">
        <div class="row align-items-center">
          <a href="javascript:void(0);" class="muze-hamburger d-block d-lg-none col-auto">
            <img src="{{asset('public/assets')}}/svg/icons/hamburger1.svg" alt="img">
            <img src="{{asset('public/assets')}}/svg/icons/close1.svg" style="width:20px;" class="menu-close" alt="img">
          </a>
          <a class="navbar-brand mx-auto d-lg-none col-auto px-0" href="#">
            <img src="{{ get_logo($basic_settings,"dark") }}" alt="Velixpay" width="100" height="auto">
            <img src="{{ get_logo($basic_settings,"dark") }}" alt="Velixpay" class="white-logo" width="100" height="auto">
          </a>
          <div class="col d-flex align-items-center">
            <a href="javascript:void(0);" class="back-arrow bg-white circle circle-sm shadow border border-gray-200 rounded mb-0">
              <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 16 16">
              <g data-name="icons/tabler/chevrons-left" transform="translate(0)">
                <rect data-name="Icons/Tabler/Chevrons Left background" width="16" height="16" fill="none"/>
                <path d="M14.468,14.531l-.107-.093-6.4-6.4a.961.961,0,0,1-.094-1.25l.094-.107,6.4-6.4a.96.96,0,0,1,1.451,1.25l-.094.108L10,7.36l5.72,5.721a.961.961,0,0,1,.094,1.25l-.094.107a.96.96,0,0,1-1.25.093Zm-7.68,0-.107-.093-6.4-6.4a.961.961,0,0,1-.093-1.25l.093-.107,6.4-6.4a.96.96,0,0,1,1.45,1.25l-.093.108L2.318,7.36l5.72,5.721a.96.96,0,0,1,.093,1.25l-.093.107a.96.96,0,0,1-1.25.093Z" transform="translate(0 1)" fill="#6C757D"/>
              </g>
            </svg>
            </a>
          </div>
     
     <div class="col-auto d-flex flex-wrap align-items-center icon-blue-hover ps-0">
    
           
              <div class="dropdown grid-option">
                <a href="#" class="text-dark ms-4 ms-xxl-5 h5 mb-0" data-bs-toggle="dropdown" aria-expanded="false" id="chat">
                  <svg id="Icons_tabler_notification" data-name="Icons/tabler/notification" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <rect id="Icons_Tabler_Notification_background" data-name="Icons/Tabler/Notification background" width="24" height="24" fill="none"/>
                    <path d="M6.162,19.63l-.005-.246v-.308H.926A.923.923,0,0,1,.471,17.35a4,4,0,0,0,1.956-2.66l.036-.229V10.726A9.492,9.492,0,0,1,7.292,2.873l.147-.08,0-.018A3.369,3.369,0,0,1,10.566.007L10.771,0a3.379,3.379,0,0,1,3.287,2.573l.045.22.147.08a9.556,9.556,0,0,1,4.806,7.541l.023.355-.007,3.582a4.016,4.016,0,0,0,2,3,.924.924,0,0,1-.329,1.719l-.126.008H15.387v.308a4.616,4.616,0,0,1-9.225.246ZM8,19.385a2.769,2.769,0,0,0,5.532.189l.007-.189v-.308H8ZM9.242,3.228l-.012.238-.005.045L9.2,3.63l-.039.113-.054.107-.035.055L9,4l-.036.038-.05.046-.1.074L8.7,4.219A7.7,7.7,0,0,0,4.332,10.46l-.022.309-.007,3.8a5.875,5.875,0,0,1-.94,2.541l-.084.119H18.266l-.007-.012a6.007,6.007,0,0,1-.983-2.452l-.043-.306V10.812a7.674,7.674,0,0,0-4.4-6.593.919.919,0,0,1-.518-.7l-.009-.132a1.538,1.538,0,0,0-3.069-.157Z" transform="translate(1.499)" fill="#1e1e1e"/>
                  </svg>
                </a>
                <div class="dropdown-menu dropdown-menu-end py-0" aria-labelledby="chat">
                  <div class="dropdown-header d-flex align-items-center px-4 py-2">
                    <span class="fs-16 Montserrat-font font-weight-semibold text-black-600">{{__("Notification")}}</span>
                  
                  </div>
                  
                  <div class="dropdown-body" data-simplebar>
                    @foreach (get_user_notifications() ?? [] as $item)
                      <a href="#" class="dropdown-item text-wrap">
                        <div class="media">
                          <span class="d-flex align-items-center">
                            <span class="avatar-status avatar-sm-status avatar-offline position-relative me-2 end-0 bottom-0">&nbsp;</span>
                            <span class="avatar avatar-xs shadow-sm rounded-circle me-2 d-flex align-items-center justify-content-center bg-white">
                              <img src="{{ auth()->user()->userImage }}" alt="user">
                            </span>
                          </span>
                          <div class="media-body ps-1">
                            <div class="d-flex align-items-center">
                              <span class="fs-16 font-weight-semibold dropdown-title">{{ __($item->message->title) }}</span>
                              <span class="font-weight-semibold tiny text-gray-600 ms-auto">{{ $item->created_at->diffForHumans() }}</span>
                            </div>
                            <span class="d-block small text-gray-600 mt-1 dropdown-content">{{ $item->message->message ?? "" }}</span>
                          </div>
                        </div>
                      </a>
                    @endforeach
                  </div>
                  <div class="dropdown-footer text-center py-2 border-top border-gray-50">
                    <a href="#" class="btn btn-link link-dark my-2">View all<svg class="ms-2" data-name="Icons/Tabler/Chevron Down" xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10">
                      <rect data-name="Icons/Tabler/Chevron Right background" width="10" height="10" fill="none"/>
                      <path d="M.163.163A.556.556,0,0,1,.886.109L.948.163,5.393,4.607a.556.556,0,0,1,.054.723l-.054.062L.948,9.837a.556.556,0,0,1-.839-.723l.054-.062L4.214,5,.163.948A.556.556,0,0,1,.109.225Z" transform="translate(2.5)" fill="#1E1E1E"/>
                    </svg>
                    </a>
                  </div>
                </div>
              </div>
         
              <div class="dropdown profile-dropdown">
                <a href="#" class="avatar avatar-sm avatar-circle ms-4 ms-xxl-5" data-bs-toggle="dropdown" aria-expanded="false" id="dropdownMenuButton">
                  <img class="avatar-img" src="{{ auth()->user()->userImage }}" alt="Avatar">
                  <span class="avatar-status avatar-sm-status avatar-success">&nbsp;</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                  <li class="pt-2 px-4">
                    <span class="fs-16 font-weight-bold text-black-600 Montserrat-font me-2">{{auth()->user()->username}}</span>
                    <img src="{{asset('public/assets')}}/svg/icons/fill-check.svg" alt="icon">
                    <small class="text-gray-600 pb-3 d-block">{{auth()->user()->email}}</small>
                  </li>
                
                  <li>
                    <a class="dropdown-item" href="{{setRoute('user.profile.index')}}"><svg data-name="Icons/Tabler/Share" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                      <rect id="Icons_Tabler_User_background" data-name="Icons/Tabler/User background" width="16" height="16" fill="none"/>
                      <path d="M11.334,16H.667a.665.665,0,0,1-.661-.568L0,15.343v-1.75A4.179,4.179,0,0,1,4.029,9.44l.193,0H7.778A4.186,4.186,0,0,1,12,13.4l0,.191v1.75a.661.661,0,0,1-.576.651ZM4.222,10.749a2.869,2.869,0,0,0-2.884,2.683l-.005.162v1.094h9.334V13.594A2.857,2.857,0,0,0,8.116,10.767l-.162-.013-.164,0ZM6,8.314A4.2,4.2,0,0,1,1.778,4.157a4.223,4.223,0,0,1,8.445,0A4.2,4.2,0,0,1,6,8.314Zm0-7A2.87,2.87,0,0,0,3.111,4.157a2.889,2.889,0,0,0,5.778,0A2.87,2.87,0,0,0,6,1.313Z" transform="translate(2)" fill="#495057"/>
                    </svg><span class="ms-2">Profile</span></a>
                  </li>
           
                  <li><hr class="dropdown-divider"></li>
                  <li>
                      <a class="dropdown-item logout-btn" href="javascript:void(0);">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                              <path d="M6.027,14.449a.8.8,0,0,0-1.193-.494..."></path>
                          </svg>
                          <span class="ms-2">退出</span>
                      </a>
                  </li>
                </ul>
              </div>
              <a href="javascript:void(0);" class="btn btn-dark btn-lg customize-btn ms-4 ms-xxl-5"><svg data-name="Icons/Tabler/Notification" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24">
                <rect data-name="Icons/Tabler/Contrast background" width="24" height="24" fill="none"/>
                <path d="M0,12A12,12,0,1,1,12,24,12.014,12.014,0,0,1,0,12Zm1.847,0A10.153,10.153,0,1,0,12,1.847,10.165,10.165,0,0,0,1.847,12Zm9.234,6.242,0-.089V5.845A.923.923,0,0,1,12,4.923a7.077,7.077,0,0,1,0,14.153A.923.923,0,0,1,11.081,18.243Z" fill="#fff"/>
              </svg><span class="ps-2">Customize</span></a>
            </div>

        </div>
    </div>

  </div>
</div>
    


<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow-dark-80">
            <div class="modal-header border-0 pb-0 align-items-start ps-4">
                <h5 class="modal-title pt-3">确认退出？</h5>
                <button type="button" class="btn btn-icon p-0" data-bs-dismiss="modal" aria-label="Close">
                    <!-- 关闭按钮 SVG 图标 -->
                    <svg data-name="icons/tabler/close" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
                        <rect data-name="Icons/Tabler/Close background" width="16" height="16" fill="none"></rect>
                        <path d="M.82.1l.058.05L6,5.272..."></path>
                    </svg>
                </button>
            </div>
            <div class="modal-body pt-2 px-4">
                <p>您确定要退出吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light px-2" data-bs-dismiss="modal">取消</button>
                <form action="{{ setRoute('user.logout') }}" method="POST" class="d-inline">
                    @csrf
                    <button type="submit" class="btn btn-primary px-2 ms-2">退出</button>
                </form>
            </div>
        </div>
    </div>
</div>

@push('script')
<script>
  $(".logout-btn").click(function(){
      $("#logoutModal").modal('show');
  });
</script>
@endpush