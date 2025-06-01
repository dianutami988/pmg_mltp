import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text widget app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
         useMaterial3: false,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Text widget app')),
        body: const Center(
          child: Text(
            'Rekayasa Perangkat Lunak 6B',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
