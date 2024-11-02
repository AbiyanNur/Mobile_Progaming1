import 'package:flutter/material.dart';

void main() {
  runApp(CobaApp());
}

class CobaApp extends StatelessWidget {
  const CobaApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super (key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabC = TabController(length: 4, vsync: this);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("WhatsApp"),
        centerTitle: false,
        bottom: TabBar(
          controller: tabC,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "chats",
            ),
            Tab(
              text: "status",
            ),
            Tab(
              text: "calls",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabC,
        children: [
          Center(
            child: Text("CAMERA"),
          ),
          Center(
            child: Text("chats"),
          ),
          Center(
            child: Text("status"),
          ),
          Center(
            child: Text("calls"),
          ),
        ],
      ),
    );
  }
}

