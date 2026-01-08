import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//无状态组件的生命周期只有build
void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(child: Center(child: Text('Hello World'))),
      ),
    );
  }
}
