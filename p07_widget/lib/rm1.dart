import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Widget App',
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
      appBar: AppBar(title: const Text('Demo Row Widget')),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(child: const Text('Button 1'), onPressed: () {}),
            Container(width: 10),
            ElevatedButton(child: const Text('Button 2'), onPressed: () {}),
            Container(width: 10),
            ElevatedButton(child: const Text('Button 3'), onPressed: () {}),
            Container(width: 10),
            ElevatedButton(child: const Text('Button 4'), onPressed: () {}),
            Container(width: 10),

          ],
        ),
      ),
    );
  }
}
