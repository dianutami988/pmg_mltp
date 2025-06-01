import 'package:flutter/material.dart';
import '../widgets/app.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Tentang Aplikasi")),
      body: Center(child: Text("Versi 1.0 - Aplikasi Praktikum Flutter")),
    );
  }
}
