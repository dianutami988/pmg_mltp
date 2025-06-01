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
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coba Widget - Snackbar')),
      body: Center(
        child: Builder(
          builder: (BuildContext context1) {
            return ElevatedButton(
              child: const Text('Tampilkan Snackbar'),
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Pesan ditampilkan dengan cara pertama'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}
