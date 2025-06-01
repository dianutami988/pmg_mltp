import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabel Mahasiswa',
      debugShowCheckedModeBanner: false,
      home: const TabelMahasiswa(),
    );
  }
}

class TabelMahasiswa extends StatelessWidget {
  const TabelMahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        backgroundColor: const Color.fromARGB(255, 88, 82, 252),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Table(
          border: TableBorder.all(color: Colors.grey, width: 1),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
          children: const [
            // Header
            TableRow(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 228, 255),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'NIM',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Nama',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // Baris 1
            TableRow(
              children: [
                Padding(padding: EdgeInsets.all(10), child: Text('1106315')),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Depandi Enda'),
                ),
              ],
            ),
            // Baris 2
            TableRow(
              children: [
                Padding(padding: EdgeInsets.all(10), child: Text('1106316')),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Budi Handoyo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
