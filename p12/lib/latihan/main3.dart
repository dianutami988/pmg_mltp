import 'dart:convert';               // Supaya bisa mem‐decode JSON dari API
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;        // Paket untuk request HTTP
import 'package:geolocator/geolocator.dart';    // Paket untuk lokasi

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Ganti dengan API Key yang kamu dapat dari OpenWeather
  final String apiKey = '52ffad8d7a1db988816dc053d720a14a';

  // Menyimpan data cuaca yang diterima (kalau sudah berhasil request)
  Map<String, dynamic>? cuacaData;
  bool loading = false;           // Menandakan aplikasi sedang request data

  // Controller untuk kotak teks (input pencarian nama kota)
  final TextEditingController kotaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Saat aplikasi pertama kali dibuka, panggil fungsi ini untuk ambil cuaca berdasarkan lokasi
    _ambilCuacaBerdasarkanLokasi();
  }

  // Fungsi untuk mengambil cuaca berdasarkan lokasi pengguna
  Future<void> _ambilCuacaBerdasarkanLokasi() async {
    setState(() {
      loading = true;   // Set loading menjadi true (menandakan sedang menunggu data)
    });

    // 1. Minta izin dan ambil posisi (latitude & longitude) pengguna
    Position posisi = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // 2. Susun URL request ke OpenWeather API
    String url =
        'https://api.openweathermap.org/data/2.5/weather'
        '?lat=${posisi.latitude}'
        '&lon=${posisi.longitude}'
        '&appid=$apiKey'
        '&units=metric'; // units=metric untuk suhu dalam Celsius

    // 3. Kirim HTTP GET ke URL tersebut
    http.Response response = await http.get(Uri.parse(url));

    // 4. Jika status code 200 (sukses), decode JSON
    if (response.statusCode == 200) {
      setState(() {
        cuacaData = json.decode(response.body);
        loading = false;   // Data sudah diterima, loading selesai
      });
    } else {
      setState(() {
        loading = false;
      });
      // Kalau gagal, kamu bisa tampilkan SnackBar atau pesan error
    }
  }

  // Fungsi untuk mencari cuaca berdasarkan nama kota
  Future<void> _cariCuacaByKota(String namaKota) async {
    if (namaKota.isEmpty) return;  // Jika kotanya kosong, langsung return

    setState(() {
      loading = true;
    });

    String url =
        'https://api.openweathermap.org/data/2.5/weather'
        '?q=$namaKota'
        '&appid=$apiKey'
        '&units=metric';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        cuacaData = json.decode(response.body);
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
      // Jika kota tidak ditemukan, tampilkan pesan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kota tidak ditemukan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Cuaca',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Cuaca'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Baris untuk input pencarian kota
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: kotaController,
                      decoration: const InputDecoration(
                        labelText: 'Cari Kota',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Panggil fungsi cari cuaca jika tombol search ditekan
                      _cariCuacaByKota(kotaController.text.trim());
                      FocusScope.of(context).unfocus(); // Tutup keyboard
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Tampilkan loading spinner jika sedang mengambil data
              if (loading) ...[
                const CircularProgressIndicator(),
              ] else if (cuacaData == null) ...[
                // Jika belum ada data cuaca sama sekali
                const Text('Belum ada data cuaca'),
              ] else ...[
                // Jika sudah ada data cuaca, tampilkan di Card
                CuacaCard(cuaca: cuacaData!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Widget terpisah untuk menampilkan data cuaca di dalam Card
class CuacaCard extends StatelessWidget {
  final Map<String, dynamic> cuaca;
  const CuacaCard({Key? key, required this.cuaca}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final main = cuaca['main'];                // Berisi suhu, kelembapan, dll.
    final weatherInfo = cuaca['weather'][0];   // Berisi deskripsi, ikon, dll.
    final namaKota = cuaca['name'];
    final suhu = main['temp'];
    final deskripsi = weatherInfo['description'];
    final ikon = weatherInfo['icon'];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              namaKota,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Tampilkan ikon cuaca dari OpenWeather
            Image.network(
              'https://openweathermap.org/img/wn/$ikon@2x.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 8),
            Text(
              '${suhu.toStringAsFixed(1)} °C',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(
              deskripsi,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
