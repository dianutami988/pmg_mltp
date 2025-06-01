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

enum Answer { YES, NO }

class _HomeState extends State<Home> {
  String answer = "";
  String message = "";
  void setAnswer(String value) {
    setState(() {
      answer = value;
      message = 'Anda memilih: $answer';
    });
  }

  Future<void> confirm(BuildContext context) async {
    var simpleDialog = SimpleDialog(
      title: const Text('Konfirmasi'),
      children: <Widget>[
        Column(
          children: <Widget>[
            const Text('Anda ingin keluar dari Aplikiasi?'),
            Container(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text(
                    'Ya',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context, Answer.YES);
                  },
                ),
                Container(width: 5.0),
                ElevatedButton(
                  child: const Text(
                    'Tidak',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context, Answer.NO);
                  },
                ),
                Container(width: 5.0),
              ],
            ),
          ],
        ),
      ],
    );
    if (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return simpleDialog;
          },
        ) ==
        Answer.YES) {
      setAnswer('Ya');
    } else {
      setAnswer('Tidak');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan Menggunakan Widget')),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 15.0),
            ElevatedButton(
              child: const Text('Show dialog'),
              onPressed: () {
                confirm(context);
              },
            ),
            Container(height: 15.0),
            Text(message, style: const TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
