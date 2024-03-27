import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text('Jagad Buku'),
      automaticallyImplyLeading: false, // disables the default back button
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // navigate to home view
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        IconButton(
          icon: Icon(Icons.category),
          onPressed: () {
            // navigate to categories view
            Navigator.pushReplacementNamed(context, '/categories');
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // navigate to settings view
            Navigator.pushReplacementNamed(context, '/settings');
          },
        ),
      ],
    );
  }
}