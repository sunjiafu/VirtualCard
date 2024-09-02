<?php
$parameters = [
    'order_id' => '202409021725269150735369',
    'amount' =>'12',
    'notify_url' => 'https://velixpay.com/user/add-money/epusdt/notify',
    'redirect_url' => 'https://velixpay.com/user/add-money'
  
];

// 第一步：按照字典顺序排序参数
ksort($parameters);

// 第二步：拼接字符串
$signString = '';
foreach ($parameters as $key => $value) {
    if (!empty($signString)) {
        $signString .= '&';
    }
    $signString .= "$key=$value";
}

// 第三步：拼接密钥
$merchant_key = 'epusdt_password_virtualcard_api';
$signString .= $merchant_key;

// 第四步：生成 MD5 签名
$sign = md5($signString);

// 打印用于生成签名的字符串和最终的签名
echo "Sign String: " . $signString . "\n";
echo "Generated Sign: " . $sign . "\n";
