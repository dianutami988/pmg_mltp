import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Action Button App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String fileName = 'img/kabinet.png';

  void selectImage(int index) {
    setState(() {
      switch (index) {
        case 0:
          fileName = 'img/kabinet.png';
          break;
        case 1:
          fileName = 'img/polbeng.png';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Action Button'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.laptop),
            onPressed: () {
              selectImage(0);
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_balance),
            onPressed: () {
              selectImage(1);
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(fileName, height: 350.0, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
