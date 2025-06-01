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
  int _selected = -1;
  String _jeniskelamin = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Text('Jenis Kelamin :'),
            RadioListTile(
              value: 0,
              groupValue: _selected,
              title: const Text('Laki-laki'),
              activeColor: Colors.green,
              secondary: const Icon(Icons.person),
              onChanged: (int? value) {
                setState(() {
                  _selected = value!;
                  _jeniskelamin = 'Laki-laki';
                });
              },
            ),
            RadioListTile(
              value: 1,
              groupValue: _selected,
              title: const Text('Perempuan'),
              activeColor: Colors.green,
              secondary: const Icon(Icons.person),
              onChanged: (int? value) {
                setState(() {
                  _selected = value!;
                  _jeniskelamin = 'Perempuan';
                });
              },
            ),
            Text('anda memilih : $_jeniskelamin'),
          ],
        ),
      ),
    );
  }
}
