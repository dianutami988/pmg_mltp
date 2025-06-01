import 'package:flutter/material.dart';
import 'dart:math'; // Tambahan untuk fungsi pow dan sqrt

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LanjutPage(title: 'Ujian'),
    );
  }
}

class LanjutPage extends StatefulWidget {
  const LanjutPage({super.key, required this.title});
  final String title;

  @override
  State<LanjutPage> createState() => _LanjutPageState();
}

class _LanjutPageState extends State<LanjutPage> {
  TextEditingController nilai1Controller = TextEditingController();
  TextEditingController nilai2Controller = TextEditingController();
  String hasil = "";

  void hitung(String operator) {
    double angka1 = double.tryParse(nilai1Controller.text) ?? 0;
    double angka2 = double.tryParse(nilai2Controller.text) ?? 0;
    double res;

    switch (operator) {
      case '+':
        res = angka1 + angka2;
        break;
      case '-':
        res = angka1 - angka2;
        break;
      case '*':
        res = angka1 * angka2;
        break;
      case '/':
        res = angka2 != 0 ? angka1 / angka2 : 0;
        break;
      case '%':
        res = angka1 % angka2;
        break;
      case '^':
        res = pow(angka1, angka2).toDouble();
        break;
      case '~/':
        res = sqrt(angka1);
        break;
      default:
        res = 0;
    }

    setState(() {
      hasil =
          operator == '~/'
              ? 'Hasil : √$angka1 = ${res.toStringAsFixed(2)}'
              : 'Hasil : $angka1 $operator $angka2 = ${res.toString()}';
    });
  }

  Widget tombolOperasi(String label) {
    return ElevatedButton(
      onPressed: () => hitung(label),
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.black),
        minimumSize: const Size(60, 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kalkulator UTS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Nilai 1'),
            ),
            TextField(
              controller: nilai1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Nilai 2'),
            ),
            TextField(
              controller: nilai2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                tombolOperasi('+'),
                tombolOperasi('-'),
                tombolOperasi('*'),
                tombolOperasi('/'),
                tombolOperasi('%'),
                tombolOperasi('^'),
                tombolOperasi('~/'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              hasil,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
