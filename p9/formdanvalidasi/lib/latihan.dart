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
  late FocusNode myFocusNode;

  final prodiController = TextEditingController();
  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final semesterController = TextEditingController();

  void printValue() {
    print("Teks pada field Program Studi: ${prodiController.text}");
  }

  showData() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Nim : ${nimController.text} \nNama : ${namaController.text} \nProdi: ${prodiController.text} \nSemester: ${semesterController.text}',
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    prodiController.addListener(printValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void validateInput() {
    FormState? form = formKey.currentState;
    const snackBar = SnackBar(content: Text('Semua data sudah tervalidasi'));
    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      showData();
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
                controller: nimController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                  icon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'User tidak boleh kosong, minimal 4 hingga 25 karakter, tidak boleh angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'email tidak boleh kosong';
                  }
                  return null;
                },
                focusNode: myFocusNode,
              ),

              const SizedBox(height: 10.0),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  hintText: 'Nomor Hp',
                  labelText: 'Nomor Hp',
                  icon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Prodi tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10.0),
              TextFormField(
                controller: semesterController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Semester tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10.0),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Prodi tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10.0),
   

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: validateInput,
                  ),
                  Container(width: 20),
                  ElevatedButton(
                    child: const Text('Fokus ke Nama'),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(myFocusNode);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
