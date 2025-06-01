import 'package:flutter/material.dart';
import 'lanjut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Halaman Login'),
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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('img/c.jpg'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Username"),
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Password"),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Kata sandi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const LanjutPage(title: 'halaman kedua'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(height: 10),

              const Text.rich(
                TextSpan(
                  text: 'Lupa Password? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Reset ®',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text.rich(
                TextSpan(
                  text: 'Tidak Punya Akun Silahkan ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Daftar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
