<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\VirtualCard;
use Illuminate\Support\Facades\Crypt;

class UpdateMaskedCard extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'update:masked_card';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '更新虚拟卡的 masked_card 字段';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info('开始更新 masked_card 字段...');

        $cards = VirtualCard::all();

        foreach ($cards as $card) {
            $cardPan = $card->card_pan;

            if ($cardPan) {
                $firstSix = substr($cardPan, 0, 6);
                $lastFour = substr($cardPan, -4);
                $masked = $firstSix . str_repeat('*', strlen($cardPan) - 10) . $lastFour;
                $card->masked_card = $masked;
                $card->save();

                $this->info("卡片 ID {$card->id} 已更新 masked_card。");
            }
        }

        $this->info('所有卡片的 masked_card 字段已更新完成。');

        return 0;
    }
}
