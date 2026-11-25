enum Hari {
  senin, selasa, rabu, kamis, jumat, sabtu, minggu
}

enum Nilai {
  a(4.0, 'Sangat baik'),
  b(3.0, 'Baik'),
  c(2.0, 'Cukup'),
  d(1.0, 'Kurang'),
  e(0.0, 'Gagal');

  const Nilai(this.bobot, this.keterangan);

  final double bobot;
  final String keterangan;

  bool get lulus => bobot >= 2.0;
}

void main() {
  const h = Hari.rabu;

  print(h.name);
  print(h.index);
  print(Hari.values.length);

  final pesan = switch (h) {
    Hari.sabtu || Hari.minggu => 'Libur',
    _ => 'Kuliah',
  };

  print(pesan);

  final n = Nilai.values.byName('b');

  print(
    '${n.name.toUpperCase()} = ${n.bobot} (${n.keterangan})',
  );

  print('Lulus: ${n.lulus}');
}