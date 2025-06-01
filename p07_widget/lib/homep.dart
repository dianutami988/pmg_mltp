import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Handling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Event Handling')),
      body: const Center(child: HelloButton()),
    );
  }
}

class HelloButton extends StatelessWidget {
  const HelloButton({Key? key}) : super(key: key);

  void action(BuildContext context) {
    var alertDialog = const AlertDialog(
      title: Text('Event-Handling'),
      content: Text('Hello World!'),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Hello"),
      onPressed: () {
        action(context);
      },
    );
  }
}
