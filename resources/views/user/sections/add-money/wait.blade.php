@extends('layouts.app')

@section('content')
<div class="container">
    <h1>{{ $page_title }}</h1>
    <p>{{ __('Your payment is being processed. Please do not refresh the page or close the browser.') }}</p>
    <p>{{ __('You will be redirected automatically once the payment is confirmed.') }}</p>
    <p>{{ __('Order ID: ') }} {{ $order_id }}</p>

    <!-- 可以添加一个定时器，几秒钟后自动刷新页面 -->
    <script>
        setTimeout(function(){
            location.reload();
        }, 5000); // 5秒后自动刷新页面
    </script>
</div>
@endsection
