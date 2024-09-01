<?php

namespace App\Notifications\User\Auth;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class SendAuthorizationCode extends Notification
{
    use Queueable;

    protected $data;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $fullname = $notifiable->fullname;
        $data = $this->data;
        return (new MailMessage)
            ->subject("Account Authorization / 帐户授权")
            ->greeting("Hello " . $fullname .  "!")
            ->line('Need to verify your account before access your dashboard. / 您需要验证您的帐户才能访问您的仪表板。')
            ->line("Your verification code: " . $data->code . " / 您的验证码是：" . $data->code)
            ->line('Thank you for using our application! / 感谢您使用我们的应用程序！');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
