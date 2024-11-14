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
        // 构建消息内容
        $message = "*✅ 新卡片申请通知*\n\n";
        
        // 用户信息
        $userInfo = "{$this->user->fullname} ({$this->user->email})";
        $userInfo = $this->telegramMarkdownV2Escape($userInfo);

        // 卡片金额
        $cardAmount = number_format($this->card->amount, 2);
        $currency = $this->card->currency ?? 'USD';
        $amountInfo = "{$cardAmount} {$currency}";
        $amountInfo = $this->telegramMarkdownV2Escape($amountInfo);

        // 申请时间
        $applyTime = $this->telegramMarkdownV2Escape(now()->format('Y-m-d H:i:s'));

        // 组装消息内容
        $message .= "*用户信息：*\n";
        $message .= "`{$userInfo}`\n\n";
        $message .= "*卡片金额：*\n";
        $message .= "`{$amountInfo}`\n\n";
        $message .= "*申请时间：*\n";
        $message .= "`{$applyTime}`";

        return TelegramMessage::create()
            ->to(env('TELEGRAM_ADMIN_CHAT_ID'))
            ->content($message)
            ->options([
                'parse_mode' => 'MarkdownV2',
                'disable_web_page_preview' => true,
            ]);
    }

    // 辅助函数：转义 MarkdownV2 特殊字符
    private function telegramMarkdownV2Escape($text)
    {
        $specialChars = ['_', '*', '[', ']', '(', ')', '~', '`', '>', '#', '+', '-', '=', '|', '{', '}', '.', '!'];
        $escapedChars = array_map(function($char) {
            return '\\' . $char;
        }, $specialChars);

        return str_replace($specialChars, $escapedChars, $text);
    }
}
