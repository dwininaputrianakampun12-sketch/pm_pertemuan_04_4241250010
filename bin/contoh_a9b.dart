import 'dart:async';

Future<int> jumlahMahasiswa(String kelas) async {
  await Future.delayed(const Duration(milliseconds: 500));

  if (kelas.isEmpty) {
    throw Exception('Kelas tidak dikenal');
  }

  return kelas.length * 10;
}

Future<void> main() async {
  await jumlahMahasiswa('')
      .then((n) => print('Jumlah: $n'))
      .catchError((Object e) => print('Gagal: $e'))
      .whenComplete(() => print('Selesai, berhasil atau gagal'));

  final jumlah = await Future.wait([
    jumlahMahasiswa('Kom-A'),
    jumlahMahasiswa('Kom-B'),
    jumlahMahasiswa('Ilkom-C'),
  ]);

  print(jumlah);
  print(jumlah.fold<int>(0, (a, b) => a + b));

  try {
    await Future.delayed(
      const Duration(seconds: 3),
      () => 'lambat',
    ).timeout(const Duration(seconds: 1));
  } on TimeoutException {
    print('Server terlalu lama menjawab');
  }
}