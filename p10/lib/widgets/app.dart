import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Menu",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Product"),
            onTap: () => Navigator.pushReplacementNamed(context, '/product'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About App"),
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
