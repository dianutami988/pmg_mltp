import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percobaan Menggunakan Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
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
            Text("Bahasa pemrograman yang dikuasai:"),
            CheckboxListTile(
              value: _checkboxVal1,
              title: Text('Pyhton'),
              activeColor: Colors.greenAccent,
              secondary: Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal1 = value ?? false;
                });
                if (this._checkboxVal1 == true)
                  list.add('Python');
                else
                  list.remove('Python');
                showData();
              },
            ),
            CheckboxListTile(
              value: this._checkboxVal2,
              title: Text('JavaScript'),
              activeColor: Colors.greenAccent,
              secondary: Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal1 = value ?? false;
                });
                if (this._checkboxVal2 == true)
                  list.add('JavaScript');
                else
                  list.remove('JavaScript');
                showData();
              },
            ),
            CheckboxListTile(
              value: this._checkboxVal3,
              title: Text('PHP'),
              activeColor: Colors.greenAccent,
              secondary: Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal1 = value ?? false;
                });
                if (this._checkboxVal3 == true)
                  list.add('PHP');
                else
                  list.remove('PHP');
                showData();
              },
            ),
            CheckboxListTile(
              value: this._checkboxVal4,
              title: Text('Java'),
              activeColor: Colors.greenAccent,
              secondary: Icon(Icons.language),
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal1 = value ?? false;
                });
                if (this._checkboxVal4 == true)
                  list.add('Java');
                else
                  list.remove('Java');
                showData();
              },
            ),
            Text('Data: ${this.text}'),
          ],
        ),
      ),
    );
  }
}
