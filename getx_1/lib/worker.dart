import 'package:flutter/material.dart';
import 'package:get/get.dart';

//controller untuk mendemonstrasikan pengguna workers
class WorkerController extends GetxController {
  var count = 0.obs;

  void onInit() {
    ever(count, (_) => print("ever: count changed to $count"));

    once(count, (_) => print("once: count changed to $count"));

    interval(count, (_) => print("internal: count changed to $count"), time: Duration(seconds: 4));

    super.onInit();
  }

  void increment() {
    count++;
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
        appBar: AppBar(title: Text("workers Example")),
        body: WorkerExample(),
      ),
    );
  }
}

class WorkerExample extends StatelessWidget {
  final WorkerController wc = Get.put(WorkerController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text("Count: ${wc.count}", style:
          TextStyle(fontSize: 24))),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: wc.increment,
              child: Text("Increment")
          ),
        ],
      ),
    );
  }
}

