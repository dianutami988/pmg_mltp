import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void validateInput() {
    FormState? form = formKey.currentState;
    const snackBar = SnackBar(content: Text('Semua data sudah tervalidasi'));
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nim',
                  labelText: 'Nim',
                  icon: Icon(Icons.person_pin),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nim tidak boleh kosong';
                  }
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nama',
                  labelText: 'Nama',
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                },
              ),

              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Program Studi',
                  labelText: 'Program Studi',
                  icon: Icon(Icons.dashboard),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Prodi tidak boleh kosong';
                  }
                },
              ),

              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Semester',
                  labelText: 'Semester',
                  icon: Icon(Icons.format_list_numbered),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Semester tidak boleh kosong';
                  }
                },
              ),

              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: validateInput,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
