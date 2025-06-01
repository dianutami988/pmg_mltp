import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: RegisterPage()));

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String role = 'User';

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool isNumericOnly(String value) => RegExp(r'^\d+$').hasMatch(value);
  bool isEmailValid(String value) =>
      RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Semua input valid
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Sukses"),
              content: Text("Semua input valid. Data siap disimpan."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      print("Username: ${_usernameController.text}");
      print("Email: ${_emailController.text}");
      print("Phone: ${_phoneController.text}");
      print("Role: $role");
    } else {
      // Ada input tidak valid
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Cek kembali isian form!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pendaftaran')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Username
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  icon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Username wajib diisi';
                  if (val.length < 4 || val.length > 25)
                    return 'Panjang username 4-25 karakter';
                  if (isNumericOnly(val))
                    return 'Username tidak boleh angka semua';
                  return null;
                },
              ),

              // Email
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Email wajib diisi';
                  if (val.length < 4 || val.length > 25)
                    return 'Panjang email 4-25 karakter';
                  if (!val.contains('@') || !isEmailValid(val))
                    return 'Format email sertakan simbol "@" dan ".com"';

                  return null;
                },
              ),

              // Nomor HP
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  icon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Nomor HP wajib diisi';
                  if (!isNumericOnly(val))
                    return 'Nomor HP harus berisikan angka';
                  if (val.length < 10 || val.length > 12)
                    return 'Nomor HP harus 10-12 digit angka';
                  return null;
                },
              ),

              // Password
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                obscureText: _obscurePassword,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Password wajib diisi';
                  if (val.length < 4 || val.length > 25)
                    return 'Panjang password 4-25 karakter';
                  return null;
                },
              ),

              // Confirm Password
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscureConfirmPassword,
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'Konfirmasi password wajib diisi';
                  if (val != _passwordController.text)
                    return 'Password tidak cocok';
                  return null;
                },
              ),

              // Role Dropdown
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: role,
                items:
                    ['User', 'Admin'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (val) => setState(() => role = val!),
                decoration: InputDecoration(
                  labelText: 'Role',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(child: Text('Daftar'), onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
