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
          color: Colors.amber,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(color: Colors.blue, height: 100),
              Expanded(child: Container(color: Colors.blueGrey)),
              Container(color: Colors.red, height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
