<script src="{{ asset('public/assets/') }}/js/theme-custom.js"></script>
<script src="{{ asset('public/frontend/') }}/js/jquery-3.6.0.js"></script>
<script src="{{ asset('public/assets/vendor/') }}/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('public/assets/vendor/') }}/lodash/lodash.min.js"></script>
<script src="{{ asset('public/assets/vendor/') }}/simplebar/dist/simplebar.min.js"></script>

<script src="{{ asset('public/backend/js/select2.js') }}"></script>
  <script src="{{ asset('public/backend/library/popup/jquery.magnific-popup.js') }}"></script>

  <!-- nice select js -->
<script src="{{ asset('public/frontend/') }}/js/jquery.nice-select.js"></script>


<script>
    $(".langSel").on("change", function() {
       window.location.href = "{{route('index')}}/change/"+$(this).val();
    });
</script>
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-5QT8DEH80J"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-5QT8DEH80J');
</script>

@include('admin.partials.notify')