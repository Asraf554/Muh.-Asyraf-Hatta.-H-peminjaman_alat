<?php

namespace App\Models;

use App\Models\Concerns\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Category extends Model
{
    use LogsActivity;

    public string $logLabel = 'kategori';

    protected $fillable = ['name'];
    public function tools(): HasMany
    {
        return $this->hasMany(Tool::class);
    }
}
