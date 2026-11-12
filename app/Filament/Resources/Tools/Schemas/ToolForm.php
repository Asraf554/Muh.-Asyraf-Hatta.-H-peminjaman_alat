<?php

namespace App\Filament\Resources\Tools\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class ToolForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('category_id')
                    ->label('Kategori')
                    ->relationship('category', 'name')
                    ->required(),
                TextInput::make('code')
                    ->label('Kode')
                    ->required(),
                TextInput::make('name')
                    ->label('Nama Alat')
                    ->required(),
                Textarea::make('specification')
                    ->label('Spesifikasi')
                    ->rows(4),
                TextInput::make('stock')
                    ->label('Stok')
                    ->required()
                    ->numeric()
                    ->default(0),
                Select::make('condition')
                    ->label('Kondisi')
                    ->required()
                    ->default('baik')
                    ->options([
                        'baik' => 'Baik',
                        'rusak' => 'Rusak',
                    ]),
            ]);
    }
}
