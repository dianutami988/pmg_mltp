import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p12/listviewapi/job.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({Key? key}) : super(key: key);

  Future<List<User>> _fetchUsers() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<User>? data = snapshot.data;
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  data[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(data[index].email),
                trailing: Text(data[index].address),
                leading: Icon(Icons.person, color: Colors.blue[400]),
                onTap: () {
                  final snackBar = SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text("Anda memilih ${data[index].name}!"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
