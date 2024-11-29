import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Snackbar Example")),
        body: SnackBarExample(),
      ),
    );
  }
}

class SnackBarExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Hello from SnackBarrrr")),
                );
              },
            child: Text("Show Normal SnackBar"),
              ),
          ElevatedButton(
              onPressed:() {
                Get.snackbar("Hello", "This is Getx snackbar",
                snackPosition: SnackPosition.BOTTOM,
                );
              },
            child: Text("Show Getx SnackBar"),
              ),
        ],
      ),
    );
  }
}

