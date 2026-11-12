<?php

namespace App\Filament\Resources\Loans\Tables;

use App\Models\ActivityLog;
use App\Models\Loan;
use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\DatePicker;
use Filament\Notifications\Notification;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;

class LoansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->poll('10s')
            ->defaultSort('created_at', 'desc')
            ->columns([
                TextColumn::make('user.name')
                    ->label('Peminjam')
                    ->searchable(),
                TextColumn::make('tool.name')
                    ->label('Alat')
                    ->searchable(),
                TextColumn::make('qty')
                    ->label('Jumlah')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('loan_date')
                    ->label('Tgl Pinjam')
                    ->date('d/m/Y')
                    ->sortable(),
                TextColumn::make('due_date')
                    ->label('Jatuh Tempo')
                    ->date('d/m/Y')
                    ->sortable(),
                TextColumn::make('return_date')
                    ->label('Tgl Kembali')
                    ->date('d/m/Y')
                    ->placeholder('-')
                    ->sortable(),
                TextColumn::make('status')
                    ->formatStateUsing(fn (string $state) => ucfirst($state))
                   ->badge()
                    ->color(fn (string $state) => match ($state) {
                        'menunggu' => 'warning',
                        'dipinjam' => 'info',
                        'ditolak' => 'danger',
                        default => 'success',
                    }),
                TextColumn::make('fine')
                    ->label('Denda')
                    ->prefix('Rp ')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                SelectFilter::make('status')
                    ->options([
                        'menunggu' => 'Menunggu',
                        'dipinjam' => 'Dipinjam',
                        'dikembalikan' => 'Dikembalikan',
                        'ditolak' => 'Ditolak',
                    ]),
                Filter::make('terlambat')
                    ->label('Terlambat')
                    ->query(fn (Builder $query) => $query->where('status', 'dipinjam')->whereDate('due_date', '<', today())),
            ])
              ->headerActions([
                Action::make('cetak')
                    ->label('Cetak Laporan')
                    ->icon('heroicon-o-printer')
                    ->url('/laporan')
                    ->openUrlInNewTab()
                    ->visible(fn () => ! auth()->user()->isPeminjam()),
            ])
            ->recordActions([
                 Action::make('setujui')
                    ->label('Setujui')
                    ->icon('heroicon-o-check')
                    ->color('success')
                    ->requiresConfirmation()
                    ->visible(fn (Loan $record) => $record->status === 'menunggu' && ! auth()->user()->isPeminjam())
                    ->action(function (Loan $record) {
                        if ($record->tool->stock < $record->qty) {
                            Notification::make()->title('Stok tidak cukup')->danger()->send();
                            return;
                        }
                        $record->tool->decrement('stock', $record->qty);
                        $record->update(['status' => 'dipinjam']);
                        ActivityLog::catat('Menyetujui peminjaman #' . $record->id);
                        Notification::make()->title('Peminjaman disetujui')->success()->send();
                    }),
                Action::make('tolak')
                    ->label('Tolak')
                    ->icon('heroicon-o-x-mark')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->visible(fn (Loan $record) => $record->status === 'menunggu' && ! auth()->user()->isPeminjam())
                    ->action(function (Loan $record) {
                        $record->update(['status' => 'ditolak']);
                        ActivityLog::catat('Menolak peminjaman #' . $record->id);
                    }),
                Action::make('kembalikan')
                    ->label('Kembalikan')
                    ->icon('heroicon-o-arrow-uturn-left')
                    ->color('info')
                    ->requiresConfirmation()
                    ->visible(fn (Loan $record) => $record->status === 'dipinjam')
                    ->schema([
                        DatePicker::make('return_date')
                            ->label('Tanggal Kembali')
                            ->default(now())
                            ->required()
                            ->hidden(fn () => auth()->user()->isPeminjam()),
                    ])
                    ->action(function (Loan $record, array $data) {
                        $tglKembali = $data['return_date'] ?? now()->toDateString();
                        $telat = (int) Carbon::parse($record->due_date)->diffInDays(Carbon::parse($tglKembali), false);
                        $record->update([
                            'return_date' => $tglKembali,
                            'status' => 'dikembalikan',
                            'fine' => max(0, $telat) * 5000,
                        ]);
                        $record->tool->increment('stock', $record->qty);
                        ActivityLog::catat('Pengembalian peminjaman #' . $record->id);
                        Notification::make()->title('Alat sudah dikembalikan')->success()->send();
                    }),
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
