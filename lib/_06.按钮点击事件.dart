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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: Center(
          //通过GestureDetector组件包裹
          // child: GestureDetector(
          //   onTap: () {
          //     print("点击了该区域");
          //   },
          //   child: Text('Hello World'),
          // ),
          //使用按钮调用函数
          child: TextButton(
            onPressed: () {
              print("点击了该区域");
            },
            child: Text("内容"),
          ),
        ),
      ),
    );
  }
}
