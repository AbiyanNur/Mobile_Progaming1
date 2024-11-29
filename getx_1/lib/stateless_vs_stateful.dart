import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management Example")),
        body: Column(
          children: [
            StatelessExample(),
            StatefulExample(),
            GetExample(),
          ],
        ),
      ),
    );
  }
}

// Stateless Widget Example
class StatelessExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello from Stateless Widget!"),
    );
  }
}

// Stateful Widget Example
class StatefulExample extends StatefulWidget {
  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          child: Text("increment Stateful"),
        ),
      ],
    );
  }
}

class GetExample extends StatelessWidget {
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text('Counter: ${c.counter}')),
        ElevatedButton(
            onPressed: c.increment,
            child: Text("Increment with Getx"),
        ),
      ],
    );
  }
}



