<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $page_title }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        .spinner {
            margin: 20px auto;
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #3498db;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .message {
            font-size: 16px;
            margin-top: 20px;
            color: #333;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        var trx_id = "{{ $trx_id }}"; // 获取从后端传递的 trx_id

        function checkPaymentStatus() {
            $.ajax({
                url: "{{ route('user.add.money.wait.page', ':trx_id') }}".replace(':trx_id', trx_id), // 动态生成正确的路由 URL
                type: 'GET',
                success: function(response) {
                    if (response.status === 'success') {
                        // 支付成功，跳转并显示成功消息
                        window.location.href = "{{ route('user.add.money.index') }}".concat("?success=Successfully%20Added%20Money");
                    } else if (response.status === 'failed') {
                        // 支付失败，处理失败的逻辑
                        alert('Payment Failed');
                    }
                },
                error: function() {
                    console.error('无法检查支付状态，请稍后再试');
                }
            });
        }

        // 每隔5秒轮询一次支付状态
        setInterval(checkPaymentStatus, 5000);
    </script>
</head>
<body>

<div class="container">
    <div class="spinner"></div>
    <div class="message">
        <p>您的支付正在处理中，请稍候...</p>
    </div>
</div>

</body>
</html>
