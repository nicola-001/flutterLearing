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
          color: Colors.blue,
          child: Align(
            alignment: Alignment.center,
            widthFactor: 1,
            heightFactor: 1,
            child: Icon(Icons.star, color: Colors.yellow, size: 100),
          ),
        ),
      ),
    );
  }
}
