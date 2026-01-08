import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
父子组件通信：父传子
1.子组件定义接收属性
2.子组件在构造函数中接收参数
3.父组件传递属性给子组件
4.有状态组件在'对外的类'接收属性，'对内的类'通过widget对象获取对应属性
5.注意!:子组件定义接收属性需要使用final关键字-因为属性由父组件决定，子组件不能随意更改
*
* */
void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("父组件", style: TextStyle(fontSize: 30, color: Colors.blue)),
              //3.父组件给自组建传递数据
              Child(message: "张三"),
            ],
          ),
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  //1.使用finall 定义属性
  final String? message;

  //2.自组建在构造函数中接收参数
  const Child({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "子组件-${message}",
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    );
  }
}
