import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String description;

  ProductDetailScreen({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Produk: $name", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Deskripsi: $description"),
          ],
        ),
      ),
    );
  }
}
