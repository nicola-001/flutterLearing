import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //声明控制器
  //滚动条的控制器
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("demo")),
        body: ListView(
          controller: _controller,
          children: List.generate(100, (index) {
            return Container(
              width: double.infinity,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              margin: EdgeInsets.only(top:20),
              child: Text('第${index + 1}个', style: TextStyle(color: Colors.white)),
            );
          }),
        ),
      ),
    );
  }
}
