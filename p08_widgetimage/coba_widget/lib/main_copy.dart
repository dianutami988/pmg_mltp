import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _checkboxVal1 = false;
  bool _checkboxVal2 = false;
  bool _checkboxVal3 = false;
  bool _checkboxVal4 = false;
  List<String> list = [];

  String text = '';
  void showData() {
    text = '';
    for (int i = 0; i < list.length; i++) {
      text += '${list[i]}, ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Percobaan Menggunakan Widget')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Bahasa pemrograman yang dikuasai:'),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal1,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal1 = value!;
                      if (_checkboxVal1 == true) {
                        list.add('Python');
                      } else {
                        list.remove('Python');
                      }
                      showData();
                    });
                  },
                ),
                Text('Python'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal2,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal2 = value!;
                      if (_checkboxVal2 == true) {
                        list.add('Javascript');
                      } else {
                        list.remove('Javascript');
                      }
                      showData();
                    });
                  },
                ),
                Text('JavaScript'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal3,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal3 = value!;
                      if (_checkboxVal3 == true) {
                        list.add('PHP');
                      } else {
                        list.remove('PHP');
                      }
                      showData();
                    });
                  },
                ),
                Text('PHP'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal4,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal4 = value!;
                      if (_checkboxVal4 == true) {
                        list.add('Java');
                      } else {
                        list.remove('Java');
                      }
                      showData();
                    });
                  },
                ),
                Text('Java'),
              ],
            ),
            Text('Data:$text'),
          ],
        ),
      ),
    );
  }
}
