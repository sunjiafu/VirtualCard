<?php
// 定义密钥
$secret_key = 'epusdt_password_virtualcard_api';

// 定义需要签名的参数
$params = [
    'amount' =>  '100',
    'order_id' => uniqid('ORDER_'),
    'redirect_url' => 'https://velixpay.com/user/add-money',
    'notify_url' => 'https://velixpay.com/user/add-money/epusdt/notify'
];

// 按照字典顺序对参数进行排序
ksort($params);

// 拼接参数为字符串
$sign_string = '';
foreach ($params as $key => $value) {
    $sign_string .= "$key=$value&";
}

// 去掉最后的&符号
$sign_string = rtrim($sign_string, '&');

// 生成签名
$signature = md5($sign_string . $secret_key);

echo "签名: " . $signature . "\n" ;
echo $params['order_id'];