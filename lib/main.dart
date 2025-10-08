import 'dart:io';
import 'kalkulator.dart';

void main() {
  final kalkulator = Kalkulator();

  print('=== Aplikasi Kalkulator Sederhana ===');

  while (true) {
    double angka1 = _mintaAngka('Masukkan angka pertama: ');
    double angka2 = _mintaAngka('Masukkan angka kedua: ');

    int? pilihan = _menuOperasi();

    if (pilihan == null || pilihan < 1 || pilihan > 4) {
      print('Pilihan tidak valid. Silakan coba lagi.');
      continue;
    }

    try {
      double hasil;
      switch (pilihan) {
        case 1:
          hasil = kalkulator.tambah(angka1, angka2);
          print('Hasil: $angka1 + $angka2 = $hasil');
          break;
        case 2:
          hasil = kalkulator.kurang(angka1, angka2);
          print('Hasil: $angka1 - $angka2 = $hasil');
          break;
        case 3:
          hasil = kalkulator.kali(angka1, angka2);
          print('Hasil: $angka1 × $angka2 = $hasil');
          break;
      }
    } catch (e) {
      print('Terjadi kesalahan: ${e.toString()}');
    }

    // 🔁 Tanya apakah ingin lanjut
    stdout.write('\nApakah Anda ingin menghitung lagi? (Y/T): ');
    String? ulang = stdin.readLineSync();

    if (ulang == null || ulang.trim().toUpperCase() != 'Y') {
      print('Terima kasih telah menggunakan kalkulator.');
      break;
    }

    print(''); // untuk spasi baris baru
  }
}

/// Fungsi untuk meminta input angka dengan validasi
double _mintaAngka(String pesan) {
  while (true) {
    stdout.write(pesan);
    String? input = stdin.readLineSync();

    if (input == null) {
      print('Input tidak boleh kosong.');
      continue;
    }

    double? angka = double.tryParse(input.replaceAll(',', '.')); // handle koma
    if (angka == null) {
      print('Input tidak valid. Harap masukkan angka yang benar.');
    } else {
      return angka;
    }
  }
}

/// Menampilkan menu operasi dan mengembalikan pilihan
int? _menuOperasi() {
  print('\nPilih operasi yang ingin dilakukan:');
  print('[1] Tambah');
  print('[2] Kurang');
  print('[3] Kali');
  print('[4] Bagi');

  stdout.write('Masukkan pilihan Anda (1-4): ');
  String? pilihan = stdin.readLineSync();
  return int.tryParse(pilihan ?? '');
}