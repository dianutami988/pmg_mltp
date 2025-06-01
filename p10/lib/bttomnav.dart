import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const MainPage(),
    );
  }
}

// Tambahkan deklarasi MainPage sebagai StatefulWidget
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Step 1: Buat daftar halaman
  final _pages = [const Home(), const Product(), const Profil()];

  // Step 2: Index halaman saat ini
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coba Bottom Navigation')),

      // Step 3: BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Product',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      // Step 4: Tampilkan halaman yang dipilih
      body: _pages[_selectedIndex],
    );
  }
}

// Halaman tidak perlu scaffold lagi karena sudah dalam Scaffold utama
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Halaman Home'));
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Halaman product'));
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Halaman profile'));
  }
}
