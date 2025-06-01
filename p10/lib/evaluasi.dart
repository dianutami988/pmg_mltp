import 'package:flutter/material.dart';
import 'screen/about.dart';
import 'screen/login.dart';
import 'screen/home.dart';
import 'screen/produk.dart';
import 'screen/profil.dart';
import 'screen/about.dart';
import 'screen/produkdetail.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (ctx) => HomeScreen(),
        '/product': (ctx) => ProductScreen(),
        '/profile': (ctx) => ProfileScreen(),
        '/about': (ctx) => AboutScreen(),
      },
    ),
  );
}
