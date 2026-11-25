
 // ignore_for_file: prefer_initializing_formals

class Mahasiswa {
  final String nim;
  final String nama;
  double _ipk;

  // Konstruktor utama
  Mahasiswa(this.nim, this.nama, {double ipk = 0})
      : _ipk = ipk;

  // Named constructor
  Mahasiswa.baru(String nim, String nama) : this(nim, nama);

  // Factory constructor
  factory Mahasiswa.dariMap(Map<String, Object?> data) {
    return Mahasiswa(
      data['nim'] as String,
      data['nama'] as String,
      ipk: (data['ipk'] as num?)?.toDouble() ?? 0,
    );
  }

  // Getter dan setter
  double get ipk => _ipk;

  set ipk(double nilai) {
    if (nilai < 0 || nilai > 4) {
      throw ArgumentError.value(
        nilai,
        'ipk',
        'harus di antara 0 dan 4',
      );
    }
    _ipk = nilai;
  }

  // Getter terhitung
  bool get cumlaude => _ipk >= 3.51;

  // Anggota static
  static const String kampus = 'UNIMED';

  @override
  String toString() =>
      '$nama ($nim) IPK ${_ipk.toStringAsFixed(2)}';
}

void main() {
  final a = Mahasiswa('4243250001', 'Butet', ipk: 3.62);

  final b = Mahasiswa.baru('4243250002', 'Ucok');

  final c = Mahasiswa.dariMap({
    'nim': '4243250003',
    'nama': 'Citra',
    'ipk': 3,
  });

  b.ipk = 3.1;

  print(a);
  print(b.cumlaude);
  print(c.ipk);
  print(Mahasiswa.kampus);

  // Pengujian setter dengan nilai 5 sesuai lembar kerja
  try {
    a.ipk = 5;
  } on ArgumentError catch (e) {
    print('Error: $e');
  }
}
