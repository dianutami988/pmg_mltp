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
  final int _count = 20;
  final List<bool> _items = <bool>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      for (var i = 0; i < _count; i++) {
        _items.add(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: ListView.builder(
        padding: const EdgeInsets.all(5.5),
        itemCount: _count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.only(left: 15.0, top: 20.0, right: 15.0),
            child: GestureDetector(
              child: ListTile(
                title: Text('Item ${index + 1}'),
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.delete),
              ),
              onTap: () {
                print('Anda memilih item ${index + 1}');
              },
            ),
          );
        },
      ),
    );
  }
}
