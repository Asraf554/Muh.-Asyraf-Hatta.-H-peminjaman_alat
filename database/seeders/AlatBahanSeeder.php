<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Tool;
use Illuminate\Database\Seeder;

class AlatBahanSeeder extends Seeder
{
    public function run(): void
    {
        // Bersihkan data versi sebelumnya yang salah (monitor/mouse/keyboard/NIC dipisah)
        Tool::whereIn('code', [
            'PRK-01', 'PRK-02', 'PRK-03', 'PRK-04',
            'JRG-02', 'JRG-03',
            'PLK-01', 'PLK-02', 'PLK-03', 'PLK-04', 'PLK-05',
        ])->delete();
        Category::whereIn('name', ['Perangkat Keras', 'Perangkat Lunak'])->doesntHave('tools')->delete();

        $alat = Category::firstOrCreate(['name' => 'Alat']);
        $komponen = Category::firstOrCreate(['name' => 'Komponen']);

        // Sesuai "Daftar Peralatan" pada soal. Stok = kolom Jumlah.
        $data = [
            [$alat, 'ALT-01', 'PC Client/Laptop', "Processor: Setara 2,0 GHz\nRAM: 4 GB\nHarddisk\nNIC: 10/100 Mbps\nMonitor 14\"\nMouse\nKeyboard", 1], // 1 set
            [$alat, 'ALT-02', 'Koneksi Internet', 'Minimal 1 Mbps', 1],                                                               // 1 line
            [$komponen, 'KMP-01', 'Sistem Operasi', 'Sesuai Kebutuhan', 1],
            [$komponen, 'KMP-02', 'Text Editor/Tools Pemrograman', 'Sesuai Kebutuhan', 1],
            [$komponen, 'KMP-03', 'Aplikasi Server Basis Data', 'Sesuai Kebutuhan', 1],
            [$komponen, 'KMP-04', 'Debugging Tools', 'Sesuai Kebutuhan', 1],
            [$komponen, 'KMP-05', 'Aplikasi Pengolahan Kata', 'Sesuai Kebutuhan', 1],
        ];

        foreach ($data as [$kategori, $kode, $nama, $spesifikasi, $stok]) {
            $tool = Tool::firstOrCreate(
                ['code' => $kode],
                ['category_id' => $kategori->id, 'name' => $nama, 'stock' => $stok, 'condition' => 'baik']
            );
            $tool->update(['specification' => $spesifikasi]);
        }
    }
}
