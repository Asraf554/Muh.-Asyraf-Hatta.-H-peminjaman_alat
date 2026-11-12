<?php

namespace App\Livewire;

use App\Models\Loan;
use App\Models\Tool;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        $loans = Loan::query();

        if (auth()->user()->isPeminjam()) {
            $loans->where('user_id', auth()->id());
        }

        return [
            Stat::make('Total Stok Alat', Tool::sum('stock')),
            Stat::make('Menunggu', (clone $loans)->where('status', 'menunggu')->count()),
            Stat::make('Dipinjam', (clone $loans)->where('status', 'dipinjam')->count()),
            Stat::make('Terlambat', (clone $loans)->where('status', 'dipinjam')->whereDate('due_date', '<', today())->count()),
        ];
    }
}
