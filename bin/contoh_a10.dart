import 'dart:async';

// Stream menggunakan async* dan yield
Stream<int> hitungMundur(int dari) async* {
  for (var i = dari; i >= 1; i--) {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    yield i;
  }
}

Future<void> main() async {
  await for (final detik in hitungMundur(3)) {
    print('Antrean dibuka dalam $detik ...');
  }

  print('Silakan masuk!');

  // StreamController
  final notifikasi = StreamController<String>();

  final langganan = notifikasi.stream
      .where((p) => p.contains('Mobile'))
      .listen((p) => print('Notifikasi: $p'));

  notifikasi.add('Nilai Pemrograman Mobile sudah keluar');
  notifikasi.add('Jadwal Jaringan berubah');
  notifikasi.add('Tugas Pemrograman Mobile baru');

  await notifikasi.close();
  await langganan.cancel();
}