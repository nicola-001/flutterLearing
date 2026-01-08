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
        //设置最外面的盒子
        body: Container(
          //设置正无穷大
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.amber),
          //设置内部的盒子
          child: Row(
            //主轴对齐方式
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,//均分模式
            // mainAxisAlignment: MainAxisAlignment.spaceAround,//环绕模式
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,//两端对齐
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //居中显示
            // mainAxisAlignment: MainAxisAlignment.start,//从头排列
            // mainAxisAlignment: MainAxisAlignment.end,//尾部对齐
            //交叉轴对齐方式
            crossAxisAlignment: CrossAxisAlignment.center,//居中对齐
            // crossAxisAlignment: CrossAxisAlignment.start ,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: 100, height: 100, color: Colors.blue),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
              ),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
