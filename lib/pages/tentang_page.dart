import 'package:flutter/material.dart';

// Halaman Tentang
// Menampilkan profil diri (gunakan kembali data dari tugas Pertemuan 2).
// TODO: Ganti nilai-nilai di bawah ini dengan data dirimu sendiri.
class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String nama = 'Nama Lengkap';
    const String kelas = 'Kelas';
    const String sekolah = 'Nama Sekolah';
    const String bio =
        'Tuliskan sedikit tentang dirimu di sini, misalnya minat '
        'terhadap pemrograman perangkat bergerak, hobi, atau cita-cita.';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 56,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, size: 64, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            nama,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '$kelas - $sekolah',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tentang Saya',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(height: 8),
          const Text(bio, textAlign: TextAlign.left),
        ],
      ),
    );
  }
}
