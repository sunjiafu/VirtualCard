<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use NotificationChannels\Telegram\TelegramMessage;
use Illuminate\Notifications\Notification;

class CardApplied extends Notification
{
    use Queueable;

    protected $user;
    protected $card;

    public function __construct($user, $card)
    {
        $this->user = $user;
        $this->card = $card;
    }

    public function via($notifiable)
    {
        return ['telegram'];
    }

    public function toTelegram($notifiable)
    {
        $message = "🆕 用户申请了新卡片：\n";
        $message .= "用户：{$this->user->fullname} ({$this->user->email})\n";
        $message .= "卡片 ID：{$this->card->card_id}\n";
        $message .= "申请时间：" . now()->format('Y-m-d H:i:s');

        return TelegramMessage::create()
            ->to(env('TELEGRAM_ADMIN_CHAT_ID'))
            ->content($message);
    }
}
