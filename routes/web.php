<?php

use App\Models\Loan;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/laporan', function () {
    abort_if(auth()->user()->isPeminjam(), 403);
    $loans = Loan::with(['user', 'tool'])->latest()->get();
    return view('laporan', compact('loans'));
})->middleware('auth');