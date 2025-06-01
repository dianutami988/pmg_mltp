import 'package:flutter/material.dart'; // perbaiki tanda kutip di sini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Widget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity, // perbaikan penulisan
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Column Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Button 1'),
              onPressed: () {},
            ),
            const SizedBox(height: 10), // Ganti Container dengan SizedBox agar rapi
            ElevatedButton(
              child: const Text('Button 2'),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Button 3'),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Button 4'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
