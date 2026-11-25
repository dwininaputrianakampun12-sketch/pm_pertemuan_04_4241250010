abstract class Koleksi {
  final String kode;
  final String judul;

  Koleksi(this.kode, this.judul);

  int get lamaPinjam;

  String info() => '[$kode] $judul (pinjam $lamaPinjam hari)';
}

class Buku extends Koleksi {
  final String penulis;

  Buku(super.kode, super.judul, this.penulis);

  @override
  int get lamaPinjam => 14;

  @override
  String info() => '${super.info()} oleh $penulis';
}

class Majalah extends Koleksi {
  final int edisi;

  Majalah(super.kode, super.judul, this.edisi);

  @override
  int get lamaPinjam => 7;
}

class EBook extends Buku {
  EBook(super.kode, super.judul, super.penulis);

  @override
  int get lamaPinjam => 30;
}

void main() {
  final List<Koleksi> rak = [
    Buku('B01', 'Dasar-Dasar Dart', 'A. Siregar'),
    Majalah('M01', 'Majalah Teknologi', 112),
    EBook('E01', 'Flutter in Action', 'Eric Windmill'),
  ];

  for (final k in rak) {
    print(k.info());
  }
}