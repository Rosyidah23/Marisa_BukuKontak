import 'package:flutter/material.dart';

// Halaman Favorit
// Untuk tahap awal, halaman ini hanya menampilkan keterangan
// bahwa belum ada kontak favorit.
class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star_border, size: 56, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            'Belum ada kontak favorit.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
