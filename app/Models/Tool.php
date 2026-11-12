<?php

namespace App\Models;

use App\Models\Concerns\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Tool extends Model
{
    use LogsActivity;

    public string $logLabel = 'alat';

  protected $fillable = ['category_id', 'code', 'name', 'specification', 'stock', 'condition'];
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}
