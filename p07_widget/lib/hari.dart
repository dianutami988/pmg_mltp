import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deskripsi Hari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String dayDescription = '';

  // Fungsi untuk mengubah deskripsi hari berdasarkan nama hari
  void showDayDescription(String day) {
    setState(() {
      switch (day) {
        case 'Senin':
          dayDescription = 'senin: Hari yang luar biasa untuk memulai pekerjaanmu';
          break;
        case 'Selasa':
          dayDescription = 'selasa: tetap semangat mengerjakan tugas';
          break;
        case 'Rabu':
          dayDescription =
              'rabu: selalu bahagia dan bersyukur dengan apa yang telah diperoleh';
          break;
        case 'Kamis':
          dayDescription = 'kamis: kerja keras untuk menggapai cita-cita';
          break;
        case 'Jumat':
          dayDescription = 'jumat: jangan lupa untuk beribadah';
          break;
        case 'Sabtu':
          dayDescription = 'sabtu: selamat weekend';
          break;
        case 'Minggu':
          dayDescription = 'minggu: manfaatkan hari minggumu untuk istirahat';
          break;
        default:
          dayDescription = 'Pilih hari untuk mengetahui deskripsinya!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deskripsi Hari')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Deskripsi Hari:', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(
              dayDescription,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => showDayDescription('Senin'),
                  child: const Text('Senin'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => showDayDescription('Selasa'),
                  child: const Text('Selasa'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => showDayDescription('Rabu'),
                  child: const Text('Rabu'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => showDayDescription('Kamis'),
                  child: const Text('Kamis'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => showDayDescription('Jumat'),
                  child: const Text('Jumat'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => showDayDescription('Sabtu'),
                  child: const Text('Sabtu'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showDayDescription('Minggu'),
              child: const Text('Minggu'),
            ),
          ],
        ),
      ),
    );
  }
}
