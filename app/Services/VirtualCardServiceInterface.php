<?php

namespace App\Services;

interface VirtualCardServiceInterface
{
    public function getCards($userId);
    public function getCardDetails($cardId);
    public function applyCard($data);
    public function rechargeCard($cardId, $amount);
    public function transferOut($cardId, $amount);
    public function freezeCard($cardId);
    public function deleteCard($cardId);
}