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
          transform: Matrix4.rotationZ(0.05),
          margin: EdgeInsets.all(20),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 3),
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text('hello,container!', style: TextStyle(color: Colors.white)),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
