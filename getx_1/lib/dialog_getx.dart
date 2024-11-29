import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dialog Example")),
        body: DialogExample(),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            showDialog(
              context: context,
                builder: (context) => AlertDialog(
                  title: Text("Hello"),
                  content: Text("This is a normal dialog"),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context),
                        child: Text("close"),
                    ),
                  ],
                ),
            );
          },
            child: Text("show normal dialog"),
          ),
          ElevatedButton(onPressed: () {
            Get.defaultDialog(
              title: "Hello",
              middleText: "This is a Getx dialog"
            );
          },
            child: Text("Show Getx Dialog"),
          ),
        ],
      ),
    );
  }
}

