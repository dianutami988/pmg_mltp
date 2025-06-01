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
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: Container(
        child: const Text(
          'RPL Polbeng',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        color: Colors.blue,
        width: 250,
        height: 100,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
