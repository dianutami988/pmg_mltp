import 'package:flutter/material.dart';
import '../widgets/app.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Profil")),
      body: Center(child: Text("Ini adalah halaman profil")),
    );
  }
}
