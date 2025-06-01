import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send SMS',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: const MyHomePage(title: 'SEND SMS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  String _message = "";

  void _sendSMS(List<String> numbers, String message) async {
    try {
      String _result = await sendSMS(message: message, recipients: numbers);
      setState(() => _message = _result);
    } catch (error) {
      setState(() => _message = error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Kirim SMS')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _numController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nomor handphone',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _msgController,
                maxLines: 5,
                decoration: const InputDecoration(hintText: 'Pesan SMS'),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                tooltip: 'Kirim SMS',
                child: const Icon(Icons.sms),
                onPressed: () {
                  List<String> numbers = [_numController.text];
                  _sendSMS(numbers, _msgController.text);
                },
              ),
              const SizedBox(height: 20),
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }
}
