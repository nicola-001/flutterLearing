import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Demo")),
        body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          // padding: EdgeInsets.all(20),
          child: Padding(
            // padding: EdgeInsets.all(20.0),
            //对称方向的内边距
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Container(decoration: BoxDecoration(color: Colors.amber)),
          ),
        ),
      ),
    );
  }
}
