import 'package:flutter/material.dart';
import 'package:p12/listviewapi/joblistview.dart';
import 'package:p12/listviewapi/job.dart'; // Pastikan nama file dan ekstensi benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      home: Scaffold(
        appBar: AppBar(title: const Text('Public User List')),
        body: const Center(child: UsersListView()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
