<?php

namespace App\Models\Concerns;

use App\Models\ActivityLog;

trait LogsActivity
{
    protected static function bootLogsActivity(): void
    {
        $events = static::$logEvents ?? ['created', 'updated', 'deleted'];
        $verbs = ['created' => 'Menambah', 'updated' => 'Mengubah', 'deleted' => 'Menghapus'];

        foreach ($verbs as $event => $verb) {
            if (! in_array($event, $events)) {
                continue;
            }

            static::$event(function ($model) use ($event, $verb) {
                if (! auth()->check()) {
                    return;
                }

                if ($event === 'updated' && collect($model->getChanges())->except(['updated_at', 'remember_token'])->isEmpty()) {
                    return;
                }

                ActivityLog::catat($verb . ' ' . $model->logLabel . ' ' . ($model->name ?? '#' . $model->id));
            });
        }
    }
}
