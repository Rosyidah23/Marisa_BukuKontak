import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buku Kontak',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const KontakPage(),
    );
  }
}

// Model sederhana untuk satu data kontak
class Kontak {
  final String nama;
  final String email;
  final String noHp;

  Kontak({required this.nama, required this.email, required this.noHp});
}

class KontakPage extends StatefulWidget {
  const KontakPage({super.key});

  @override
  State<KontakPage> createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  // List untuk menyimpan seluruh data kontak yang sudah ditambahkan
  final List<Kontak> _daftarKontak = [];

  // TextEditingController untuk setiap field form
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();

  void _simpanKontak() {
    // Validasi sederhana: nama tidak boleh kosong
    if (_namaController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong')),
      );
      return;
    }

    setState(() {
      _daftarKontak.add(
        Kontak(
          nama: _namaController.text.trim(),
          email: _emailController.text.trim(),
          noHp: _noHpController.text.trim(),
        ),
      );

      // Kosongkan kembali form setelah data disimpan
      _namaController.clear();
      _emailController.clear();
      _noHpController.clear();
    });
  }

  @override
  void dispose() {
    // Selalu buang (dispose) controller yang sudah tidak dipakai
    _namaController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Kontak'),
      ),
      body: Column(
        children: <Widget>[
          // ===== FORM INPUT =====
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _noHpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Nomor Handphone',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _simpanKontak,
                    icon: const Icon(Icons.save),
                    label: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 1),

          // ===== DAFTAR KONTAK =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Kontak (${_daftarKontak.length})',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: _daftarKontak.isEmpty
                ? const Center(child: Text('Belum ada kontak. Tambahkan di atas ya!'))
                : ListView.builder(
                    itemCount: _daftarKontak.length,
                    itemBuilder: (context, index) {
                      final kontak = _daftarKontak[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(kontak.nama.isNotEmpty ? kontak.nama[0].toUpperCase() : '?'),
                          ),
                          title: Text(kontak.nama),   
                          subtitle: Text('${kontak.email}\n${kontak.noHp}'),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                _daftarKontak.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}