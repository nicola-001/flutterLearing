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
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,

          
          //获取网络图片
          // Image.network(
          //   'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
          //   width: 100,
          //   height: 100,
          //   fit: BoxFit.cover,
          // ),
          //使用资源文件
          child: Image.asset(
            'lib/images/favicon.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
