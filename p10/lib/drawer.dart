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
      theme: ThemeData(primarySwatch: Colors.blue),

      //step 1
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Home(),
        '/product': (BuildContext context) => const Product(),
        '/profil': (BuildContext context) => const Profil(),
      },
    );
  }
}

//step2
Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
      
        ListTile(
          title: const Text('Home'),
          leading: const Icon(Icons.home),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Product'),
          leading: const Icon(Icons.add_shopping_cart),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/product');
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Profile'),
          leading: const Icon(Icons.person),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/profil');
          },
        ),
      ],
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //step 3
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Halaman Home')),
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //step 3
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('Product')),
      body: const Center(child: Text('Halaman product')),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //step 3
      drawer: buildDrawer(context),
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Halaman profile')),
    );
  }
}
