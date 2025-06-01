import 'package:flutter/material.dart';

void main() {
  runApp(MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Saya 🌸',
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF89CFF0), // Biru pastel ala anime
        title: Text(
          'Profil Saya 🌸',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Roboto', // Font default Flutter
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        // Menggunakan gambar sebagai background
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'img/kk.jpg',
            ), // Ganti dengan nama gambar background
            fit: BoxFit.cover, // Menyesuaikan ukuran gambar dengan layar
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Foto Profil (Gambar)
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                      'img/pii.jpg',
                    ), // Ganti dengan gambar
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 20),

                  // Kartu Biodata dengan Sentuhan Anime
                  BiodataCard(
                    icon: Icons.person,
                    label: 'Nama Lengkap',
                    value: 'Dian Utami',
                  ),
                  BiodataCard(
                    icon: Icons.cake,
                    label: 'Tempat, Tanggal Lahir',
                    value: 'Bengkalis, 09 april 2004',
                  ),
                  BiodataCard(
                    icon: Icons.email,
                    label: 'Email',
                    value: 'dianutami988@gmail.com',
                  ),
                  BiodataCard(
                    icon: Icons.phone,
                    label: 'Nomor HP',
                    value: '0800-1234-5678',
                  ),
                  BiodataCard(
                    icon: Icons.favorite,
                    label: 'Hobi',
                    value:
                        'Nonton anime, baca komik, menggambar, dengar musik, mengedit',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BiodataCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const BiodataCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 64, 137, 222), // Warna pastel cerah
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Color.fromARGB(255, 92, 201, 252)), // Warna cerah ala anime
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Roboto', // Font default Flutter
            color: Color.fromARGB(255, 92, 247, 252),
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto', // Font default Flutter
            color: Color.fromARGB(255, 248, 247, 252), // Warna teks lembut
          ),
        ),
      ),
    );
  }
}
