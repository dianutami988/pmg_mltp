import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edgelnsets.only App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
      appBar: AppBar(title: const Text('Metode Edgelnsets.only')),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.tealAccent,
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                child: const Text('Button'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
