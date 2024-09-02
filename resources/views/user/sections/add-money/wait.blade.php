<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付处理中</title>
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
    <script>
        setTimeout(function() {
            window.location.href = "{{ route('user.add.money.index') }}"; // 5秒后跳转到充值首页
        }, 5000);
    </script>
</head>
<body>

<div class="container">
    <div class="spinner"></div>
    <div class="message">
        <p>您的支付正在处理中，请稍候...</p>
        <p>页面将在5秒钟后自动跳转。</p>
    </div>
</div>

</body>
</html>
