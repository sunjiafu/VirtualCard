<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\TemporaryData;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;

class EpusdtPaymentTest extends TestCase
{
    use RefreshDatabase;

    public function setUp(): void
    {
        parent::setUp();
        // 设置测试环境数据，如创建测试用户
        $this->user = User::factory()->create();
        $this->actingAs($this->user);
    }

    /** @test */
    public function it_can_initialize_epusdt_payment()
    {
        // 模拟支付网关的响应
        Http::fake([
            'https://epusdt-payment-gateway.com/*' => Http::response([
                'status_code' => 200,
                'data' => [
                    'payment_url' => 'https://mock-payment-url.com',
                ]
            ], 200),
        ]);

        // 设置虚拟的支付数据
        $output = [
            'amount' => (object) ['total_amount' => 100.0],
            'wallet' => (object) ['id' => 1],
            'currency' => (object) ['id' => 1, 'currency_code' => 'USD'],
            'gateway' => (object) ['id' => 1, 'credentials' => [
                ['label' => 'merchant_key', 'value' => 'test_merchant_key'], 
                ['label' => 'payment_url', 'value' => 'https://epusdt-payment-gateway.com']
            ]],
        ];

        // 调用 epusdtInit 方法
        $response = $this->call('POST', '/user/add-money/submit', $output);

        // 断言支付网关返回的URL
        $this->assertEquals($response->getTargetUrl(), 'https://mock-payment-url.com');

        // 断言临时数据是否正确存储
        $this->assertDatabaseHas('temporary_data', [
            'identifier' => 'AM12345678', // 使用订单号或虚拟数据
        ]);
    }

    /** @test */
    public function it_can_handle_epusdt_notify_callback()
    {
        // 模拟临时数据
        TemporaryData::create([
            'type' => 'epusdt',
            'identifier' => 'AM12345678',
            'data' => [
                'amount' => ['requested_amount' => 100.0],
                'wallet_id' => 1,
                'currency' => (object) ['id' => 1],
            ]
        ]);

        // 模拟回调数据
        $callbackData = [
            'order_id' => 'AM12345678',
            'amount' => 100,
            'status' => 'success',
        ];

        // 调用回调通知的API
        $response = $this->post('/api/add-money/epusdt/notify', $callbackData);

        // 断言回调处理成功
        $response->assertStatus(200);

        // 断言交易记录是否插入
        $this->assertDatabaseHas('transactions', [
            'trx_id' => 'AM12345678',
            'status' => 'success',
        ]);
    }
}
