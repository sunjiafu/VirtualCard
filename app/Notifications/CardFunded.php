<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use NotificationChannels\Telegram\TelegramMessage;
use Illuminate\Notifications\Notification;

class CardFunded extends Notification
{
    use Queueable;

    protected $user;
    protected $card;
    protected $amount;

    public function __construct($user, $card, $amount)
    {
        $this->user = $user;
        $this->card = $card;
        $this->amount = $amount;
    }

    public function via($notifiable)
    {
        return ['telegram'];
    }

    public function toTelegram($notifiable)
    {
        $message = "💰 用户为卡片充值：\n";
        $message .= "用户：{$this->user->fullname} ({$this->user->email})\n";
        $message .= "卡片 ID：{$this->card->card_id}\n";
        $message .= "充值金额：{$this->amount}\n";
        $message .= "充值时间：" . now()->format('Y-m-d H:i:s');

        return TelegramMessage::create()
            ->to(env('TELEGRAM_ADMIN_CHAT_ID'))
            ->content($message);
    }
}
