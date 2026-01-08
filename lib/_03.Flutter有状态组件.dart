import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

//创建有状态组建的第一个类：对外
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

//定义第二个类：对内 负责处理数据 处理业务  渲染视图
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "有状态组件",
      home: Scaffold(
        appBar: AppBar(title: Text("头部")),
        body: Container(child: Center(child: Text("中部"))),
        bottomNavigationBar: Container(
          height: 80,
          child: Container(child: Center(child: Text("底部"))),
        ),
      ),
    );
  }
}
