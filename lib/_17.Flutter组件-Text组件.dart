import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

//获取列表
List<Widget> getList() {
  return List.generate(10, (index) {
    return Container(width: 100, height: 100, color: Colors.blue);
  });
  // return [];
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Demo")),
        body: Container(
          //同一段文本中显示不同的样式
          child: Text.rich(
            TextSpan(
              text: 'Hello ',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              children: [
                TextSpan(
                  text: 'Flutter ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: '！',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          //文本过多时使用...显示
          // child: Text('今天是一个好日子！今天是一个好日子！今天是一个好日子！今天是一个好日子！今天是一个好日子！今天是一个好日子！',
          //   style: TextStyle(color: Colors.blue, fontSize: 15),
          //   overflow: TextOverflow.ellipsis,
          // ),
          //基础用法
          // child: Text(
          //   'Hello Flutter！',
          //   style: TextStyle(
          //     fontSize: 20,
          //     color: Colors.blue,
          //     fontStyle: FontStyle.italic,
          //     fontWeight: FontWeight.bold,
          //     decoration: TextDecoration.underline,
          //     decorationColor: Colors.amber,
          //   ),
          // ),
        ),
      ),
    );
  }
}
