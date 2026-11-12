<?php

namespace App\Filament\Resources\Loans\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Schema;
use App\Models\Tool;

class LoanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('user_id')
                    ->label('Peminjam')
                    ->relationship('user', 'name')
                    ->hidden(fn () => auth()->user()->isPeminjam())
                    ->required(),
                Select::make('tool_id')
                    ->label('Alat')
                    ->relationship('tool', 'name', fn ($query, string $operation) => $operation === 'create'
                        ? $query->where('stock', '>', 0)->where('condition', 'baik')
                        : $query)
                    ->required(),
                TextInput::make('qty')
                    ->label('Jumlah')
                    ->required()
                    ->numeric()
                    ->minValue(1)
                    ->maxValue(fn (Get $get, string $operation) => $operation === 'create'
                        ? (Tool::find($get('tool_id'))?->stock ?? PHP_INT_MAX)
                        : PHP_INT_MAX)
                    ->default(1),
                DatePicker::make('loan_date')
                    ->label('Tanggal Pinjam')
                    ->default(now())
                    ->required(),
                DatePicker::make('due_date')
                    ->label('Jatuh Tempo')
                    ->afterOrEqual('loan_date')
                    ->required(),
                Select::make('status')
                    ->label('Status')
                    ->options([
                        'menunggu' => 'Menunggu',
                        'dipinjam' => 'Dipinjam',
                        'dikembalikan' => 'Dikembalikan',
                        'ditolak' => 'Ditolak',
                    ])
                    ->visible(fn (string $operation) => $operation === 'edit' && auth()->user()->isAdmin())
                    ->required(),
                DatePicker::make('return_date')
                    ->label('Tanggal Kembali')
                    ->visible(fn (string $operation) => $operation === 'edit' && auth()->user()->isAdmin()),
                TextInput::make('fine')
                    ->label('Denda (Rp)')
                    ->numeric()
                    ->default(0)
                    ->visible(fn (string $operation) => $operation === 'edit' && auth()->user()->isAdmin()),
            ]);
    }
}
