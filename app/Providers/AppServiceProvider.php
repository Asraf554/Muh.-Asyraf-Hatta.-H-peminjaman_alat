<?php

namespace App\Providers;

use App\Models\ActivityLog;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Logout;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Event::listen(Login::class, fn (Login $event) => ActivityLog::create(['user_id' => $event->user->getAuthIdentifier(), 'activity' => 'Login']));
        Event::listen(Logout::class, fn (Logout $event) => $event->user && ActivityLog::create(['user_id' => $event->user->getAuthIdentifier(), 'activity' => 'Logout']));
    }
}
