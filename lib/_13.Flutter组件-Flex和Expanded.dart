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
          child: Flex(
            direction: Axis.horizontal,
            //水平方向
            //Expanded强制子组件填满所有剩余空间，Flexible根据自身大小调整,不强制占满空间， fit: FlexFit.tight,可以实现和Expanded效果一样
            children: [
              // Expanded(
              //   flex: 1,
              //   child: Container(width: 100, height: 100, color: Colors.red),
              // ),
              // Expanded(
              //   flex: 2,
              //   child: Container(width: 100, height: 100, color: Colors.green),
              // ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(width: 100, height: 100, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
