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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan Menggunakan Widget')),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 15.0),
            const Text(
              'yang',
              style: TextStyle(fontFamily: 'Alegreyaa', fontSize: 30),
            ),
            Container(height: 15.0),
            const Text(
              'penting',
              style: TextStyle(
                fontFamily: 'Alegreyaa',
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),
            Container(height: 15.0),
            const Text(
              'berhasil',
              style: TextStyle(
                fontFamily: 'Alegreyaa',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
