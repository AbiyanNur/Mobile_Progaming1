import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text(
            "INI HALAMAN HOME",
          style: TextStyle(
          fontSize: 20,
        ),
        ),
      ),
    );
  }
}
