import 'dart:io';

Future<void> main() async {
  final berkas = File('catatan.txt');

  // Menulis dan menambahkan isi berkas
  await berkas.writeAsString('Pertemuan 4: OOP\n');

  await berkas.writeAsString(
    'Pertemuan 4: Async\n',
    mode: FileMode.append,
  );

  // Membaca isi berkas
  print(await berkas.readAsString());

  final baris = await berkas.readAsLines();
  print('Jumlah baris: ${baris.length}');

  // Memeriksa dan menghapus berkas
  if (await berkas.exists()) {
    await berkas.delete();
    print('Berkas dihapus');
  }

  // Menangani berkas yang tidak ditemukan
  try {
    await File('tidak_ada.txt').readAsString();
  } on FileSystemException catch (e) {
    print('Gagal membaca: ${e.message}');
  }
}