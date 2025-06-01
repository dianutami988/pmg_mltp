import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Column Widget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Row & Column Widget')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Button 1'),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Button 2'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Button 3'),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Button 4'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Button 5'),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: const Text('Button 6'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
