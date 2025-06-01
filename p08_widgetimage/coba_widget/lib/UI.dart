import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catatan App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
         useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  
  final String judul = "cihuy";
  final String tempat = "bengkalis"

  @override
  Widget build(BuildContext context) {
    final List<String> notes = [
      'Belajar Flutter',
      'Beli bahan makanan',
      'Meeting jam 10'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Saya'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(notes[index]),
              leading: const Icon(Icons.note),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi tambah catatan
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
