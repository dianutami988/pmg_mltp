import 'package:flutter/material.dart';
import '../widgets/app.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Beranda")),
      body: Center(child: Text("Selamat Datang di Beranda")),
    );
  }
}
