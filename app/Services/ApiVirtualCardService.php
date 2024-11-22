<?php

namespace App\Services;

class ApiVirtualCardService implements VirtualCardServiceInterface
{
    public function getCards($userId)
    {
        // 调用 API 获取虚拟卡列表
    }

    public function getCardDetails($cardId)
    {
        // 调用 API 获取虚拟卡详情
    }

    public function applyCard($data)
    {
        // 调用 API 申请虚拟卡
    }

    public function rechargeCard($cardId, $amount)
    {
        // 调用 API 充值虚拟卡
    }

    public function transferOut($cardId, $amount)
    {
        // 调用 API 执行转出操作
    }

    public function freezeCard($cardId)
    {
        // 调用 API 冻结虚拟卡
    }

    public function deleteCard($cardId)
    {
        // 调用 API 删除虚拟卡
    }
}