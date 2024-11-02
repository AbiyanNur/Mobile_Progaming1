import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(CobaAplikasi());
}

class CobaAplikasi extends StatefulWidget {
  const CobaAplikasi({super.key});

  @override
  State<CobaAplikasi> createState() => _CobaAplikasiState();
}

class _CobaAplikasiState extends State<CobaAplikasi> {
  int nilai = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("increment Apps"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$nilai",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                SizedBox (height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        nilai = nilai - 1;
                        print(nilai);
                        setState(() {});
                      },
                      child: Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        nilai = nilai + 1;
                        print(nilai);
                        setState(() {});
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
          ),
        ),
      ),
    );
  }
}



