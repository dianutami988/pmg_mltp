import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logo Vokasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vokasi Kuat Indonesia')),
      body: Center(child: Image.asset('img/vokasi.png')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika FAB ditekan
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Aksi ikon jangkar ditekan!')),
          );
        },
        child: const Icon(Icons.anchor),
      ),
    );
  }
}
