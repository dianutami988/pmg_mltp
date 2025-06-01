import 'package:flutter/material.dart';
import '../widgets/app.dart';
import '../screen/produkdetail.dart';

class ProductScreen extends StatelessWidget {
  final products = [
    {'name': 'Produk A', 'description': 'Deskripsi A'},
    {'name': 'Produk B', 'description': 'Deskripsi B'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Product")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder:
            (ctx, i) => ListTile(
              title: Text(products[i]['name']!),
              subtitle: Text(products[i]['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ProductDetailScreen(
                          name: products[i]['name']!,
                          description: products[i]['description']!,
                        ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
