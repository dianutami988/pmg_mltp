import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Softwrap App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final String longText = '''
Politeknik Negeri Bengkalis (POLBENG) adalah satu-satunya politeknik negeri
yang berada di Riau. Pada tanggal 29 Juli 2011, Politeknik Bengkalis resmi menjadi
PTN dengan nama Politeknik Negeri Bengkalis melalui Peraturan Menteri Pendidikan
Nasional (Permendiknas) No. 28 tahun 2011 tentang Pendirian, Organisasi dan Tata
Kerja Politeknik Negeri Bengkalis. Hingga saat ini POLBENG sudah memiliki 8 jurusan
yaitu teknik perkapalan, teknik mesin, teknik elektro, teknik sipil, administrasi niaga,
teknik informatika, kemaritiman dan bahasa.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metode Text.softWrap')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const Text(
                'Politeknik Negeri Bengkalis',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              longText,
              style: const TextStyle(fontSize: 20.0),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
