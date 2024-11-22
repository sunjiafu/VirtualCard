<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\VirtualCardServiceInterface;
use App\Services\ManualVirtualCardService;
use App\Services\ApiVirtualCardService;

class VirtualCardServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind(VirtualCardServiceInterface::class, function ($app) {
            if (config('services.virtual_card.use_api')) {
                return new ApiVirtualCardService();
            } else {
                return new ManualVirtualCardService();
            }
        });
    }

    public function boot()
    {
        //
    }
}