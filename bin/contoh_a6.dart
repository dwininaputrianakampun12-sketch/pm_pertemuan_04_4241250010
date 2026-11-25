class Kotak<T> {
  final T isi;

  const Kotak(this.isi);

  T ambil() => isi;
}

class Hasil<T> {
  final T? data;
  final String? galat;

  const Hasil.sukses(T this.data) : galat = null;
  const Hasil.gagal(String this.galat) : data = null;

  bool get berhasil => galat == null;
}

T terbesar<T extends num>(List<T> daftar) =>
    daftar.reduce((a, b) => a > b ? a : b);

Hasil<int> bacaSks(String teks) {
  final n = int.tryParse(teks);

  return n == null
      ? const Hasil.gagal('SKS harus angka')
      : Hasil.sukses(n);
}

void main() {
  const k1 = Kotak<String>('Dart');
  const k2 = Kotak(3.75);

  print('${k1.ambil().length} ${k2.ambil()}');

  print(terbesar([78, 92, 55]));
  print(terbesar([2.5, 3.75]));

  final h = bacaSks('tiga');

  print(h.berhasil ? h.data : h.galat);

  final Map<String, List<int>> nilaiPerMk = {
    'Mobile': [85, 90],
  };

  print(nilaiPerMk['Mobile']?.first);
}