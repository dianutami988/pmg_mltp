import 'package:flutter/material.dart';
import 'package:p12/listviewapi/joblistview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      home: Scaffold(
        appBar: AppBar(title: const Text('Job Portal')),
        body: const Center(child: JobsListView()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
