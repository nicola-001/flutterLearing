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
          height: double.infinity,
          width: double.infinity,
          color: Colors.amber,
          child: Wrap(
            spacing: 10, //横向间距 主轴间距
            runSpacing: 10, //纵向间距 交叉轴间距
            alignment: WrapAlignment.spaceEvenly, //对齐方式
            direction: Axis.horizontal, //横向排列
            children: getList(),
          ),
        ),
      ),
    );
  }
}
