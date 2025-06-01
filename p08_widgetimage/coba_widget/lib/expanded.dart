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
      body: SafeArea(
        child: Column(
          children: [
            Row(children: const [ExpandedWidget(), FlexibleWidget()]),
            Row(children: const [ExpandedWidget(), ExpandedWidget()]),
            Row(children: const [FlexibleWidget(), FlexibleWidget()]),
            Row(children: const [FlexibleWidget(), ExpandedWidget()]),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(color: Colors.teal, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
