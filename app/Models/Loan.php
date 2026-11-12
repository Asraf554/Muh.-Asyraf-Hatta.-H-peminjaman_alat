<?php

namespace App\Models;

use App\Models\Concerns\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Loan extends Model
{
    use LogsActivity;

    protected static array $logEvents = ['created', 'deleted'];
    public string $logLabel = 'peminjaman';

    protected $fillable = ['user_id', 'tool_id', 'qty', 'loan_date', 'due_date', 'return_date', 'status', 'fine'];

    protected $casts = [
        'loan_date' => 'date',
        'due_date' => 'date',
        'return_date' => 'date',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function tool(): BelongsTo
    {
        return $this->belongsTo(Tool::class, 'tool_id');
    }
}