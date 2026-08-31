import 'package:flutter/material.dart';

// Halaman Tentang (Profil Siswa)
// Dibuka lewat Navigator.push dari menu "Tentang Saya" di Drawer,
// jadi halaman ini punya Scaffold + AppBar sendiri (otomatis dapat
// tombol kembali/back dari Navigator).
class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF), // ungu-pink sangat muda
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF7FF),
        elevation: 0,
        title: const Text(
          'Profil Siswa',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto profil
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/images/41.png',
                ),
              ),
              const SizedBox(height: 12),

              // Ikon
              const Icon(
                Icons.person_outline,
                size: 26,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),

              // Nama lengkap
              const Text(
                'Marisa Aprilya Hapsari', // GANTI dengan nama kamu
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Kelas
              const Text(
                'XII RPL B', // GANTI sesuai kelas kamu
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 6),

              // Nama sekolah
              const Text(
                'SMK Negeri 5 Surakarta', // GANTI sesuai sekolah kamu
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}