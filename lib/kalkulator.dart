class Kalkulator {
  double tambah(double a, double b) => a + b;

  double kurang(double a, double b) => a - b;

  double kali(double a, double b) => a * b;

  double bagi(double a, double b) {
    if (b == 0) {
      throw Exception('Tidak dapat membagi dengan nol!');
    }
    return a / b;
  }
}
