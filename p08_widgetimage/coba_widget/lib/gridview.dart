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
  final List<String> _names = ['a', 'b', 'c', 'd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(_names.length, (index) {
          return GridTile(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/${_names[index]}.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
