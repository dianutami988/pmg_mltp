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
  TimeOfDay _time = TimeOfDay.now();
  Future<void> selectDate(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (selected != _time) {
      setState(() {
        _time = selected!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('waktu yang Anda pilih: ${_time.toString()}'),
              ElevatedButton(
                onPressed: () {
                  selectDate(context);
                },
                child: const Text('Pilih waktu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
