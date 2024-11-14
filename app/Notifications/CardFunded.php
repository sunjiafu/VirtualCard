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
        // 构建消息内容
        $message = "*💰 卡片充值通知*\n\n";
        
        // 用户信息
        $userInfo = "{$this->user->fullname} ({$this->user->email})";
        $userInfo = $this->telegramMarkdownV2Escape($userInfo);

        // 卡片金额
        $fundAmount = number_format($this->amount, 2);
        $currency = $this->card->currency ?? 'USD';
        $fundInfo = "{$fundAmount} {$currency}";
        $fundInfo = $this->telegramMarkdownV2Escape($fundInfo);

        // 掩码后的卡号
        $maskedCard = $this->card->masked_card;
        $maskedCard = $this->telegramMarkdownV2Escape($maskedCard);

        // 充值时间
        $fundTime = $this->telegramMarkdownV2Escape(now()->format('Y-m-d H:i:s'));

        // 组装消息内容
        $message .= "*用户信息：*\n";
        $message .= "`{$userInfo}`\n\n";
        $message .= "*卡号：*\n";
        $message .= "`{$maskedCard}`\n\n";
        $message .= "*充值金额：*\n";
        $message .= "`{$fundInfo}`\n\n";
        $message .= "*充值时间：*\n";
        $message .= "`{$fundTime}`";

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
