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
        $message = "<b>✅ 新卡片申请通知</b>\n\n";
        
        // 对内容进行 HTML 实体编码
        $userInfo = htmlspecialchars("{$this->user->fullname}\n{$this->user->email}", ENT_QUOTES, 'UTF-8');
        $maskedCard = htmlspecialchars($this->card->masked_card, ENT_QUOTES, 'UTF-8');
        $applyTime = htmlspecialchars(now()->format('Y-m-d H:i:s'), ENT_QUOTES, 'UTF-8');
    
        // 使用 <code> 标签创建可复制的蓝色背景文本块
        $message .= "用户信息：\n<code>{$userInfo}</code>\n\n";
        $message .= "卡号：\n<code>{$maskedCard}</code>\n\n";
        $message .= "申请时间：\n<code>{$applyTime}</code>";
    
        return TelegramMessage::create()
            ->to(env('TELEGRAM_ADMIN_CHAT_ID'))
            ->content($message)
            ->options(['parse_mode' => 'HTML']); // 使用 options 方法设置 parse_mode
    }
    
}
