<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaymentCallbackController extends Controller
{
    public function handleCallback(Request $request)
    {
        // 获取所有回调数据
        $callbackData = $request->all();

        // 定义要保存的文件路径
        $filePath = storage_path('logs/payment_callback.txt');

        // 将数据保存到文件
        file_put_contents($filePath, json_encode($callbackData) . PHP_EOL, FILE_APPEND);

        // 返回一个成功的响应
        return response()->json(['status' => 'success']);
    }
}
