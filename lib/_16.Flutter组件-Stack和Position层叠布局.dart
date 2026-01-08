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
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          //Positioned必须放到Stack中
          child: Stack(
            children: [
              Container(width: 200, height: 200, color: Colors.grey),
              Positioned(
                top: 10,
                left: 10,
                child: Container(width: 50, height: 50, color: Colors.red),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
            ],
          ),
          // stack的基础用法
          // child: Stack(
          //   alignment: Alignment.center, //控制非定位自组建在stack中的对齐方式，默认是在左上角
          //   children: [
          //     Container(width: 200, height: 200, color: Colors.red),
          //     Container(width: 100, height: 100, color: Colors.green),
          //     Container(width: 50, height: 50, color: Colors.blue),
          //   ],
          // ),
        ),
      ),
    );
  }
}
