import 'package:flutter/material.dart';
import 'pages/beranda_page.dart';
import 'pages/tambah_kontak_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buku Kontak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      // Named Routes, sesuai materi Navigasi dan Routing
      initialRoute: '/',
      routes: {
        '/': (context) => const BerandaPage(),
        '/tambah-kontak': (context) => const TambahKontakPage(),
      },
    );
  }
}
