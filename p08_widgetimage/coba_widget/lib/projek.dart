import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visi & Misi RPL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      home: const VisiMisiPage(),
    );
  }
}

class VisiMisiPage extends StatelessWidget {
  const VisiMisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projek Percobaan', style: GoogleFonts.josefinSans()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Visi",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Prodi D4 Rekayasa Perangkat Lunak yang telah ditetapkan oleh Direktur '
                'Politeknik Negeri Bengkalis melalui surat keputusan No. 2061/PL31/TU/2016 adalah ',
                style: GoogleFonts.josefinSans(fontSize: 16),
              ),
              Text(
                '"Menjadi Program Studi vokasi yang menghasilkan lulusan bidang rekayasa perangkat lunak '
                'berstandar Nasional dan menuju reputasi Internasional pada tahun 2020".',
                style: GoogleFonts.josefinSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Misi",
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '1. Menyelenggarakan pendidikan dan meningkatkan kemampuan mahasiswa dalam menerapkan Ilmu Pengetahuan '
                'dan Teknologi Rekayasa Perangkat Lunak bidang Rekayasa web dan Aplikasi mobile untuk meningkatkan daya saing yang tinggi.\n\n'
                '2. Menciptakan, mengembangkan dan menerapkan ilmu pengetahuan dan teknologi untuk menghasilkan produk unggulan rekayasa perangkat lunak.\n\n'
                '3. Meningkatkan pemanfaatan teknologi informasi dalam mengatasi permasalahan-permasalahan di lingkungan internal maupun lingkungan eksternal (industri, pemerintah dan masyarakat umum).\n\n'
                '4. Melaksanakan dan mengembangkan desain dan jejaring kerjasama bidang rekayasa perangkat lunak yang berkelanjutan dengan institusi dalam dan luar negeri.',
                style: GoogleFonts.josefinSans(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
