import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

//GridView.count:基于固定的列数
//GridView.entent:基于固定的子项的对大宽度
//GridView.builder:基于网格项数量巨大或动态生成的情况--需要接受gridDelegate布局委托属性

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
        appBar: AppBar(title: Text("demo")),
        //懒加载
        body: GridView.builder(
          //布局委托
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.5, //宽高比
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                "第${index + 1}个",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
        // body: GridView.extent(
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   maxCrossAxisExtent: 100,
        //   children: List.generate(100, (int index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       color: Colors.blue,
        //       child: Text(
        //         "第${index + 1}个",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),
        //  设置固定的列数或行数
        // body: GridView.count(
        //   //控制横向、纵向
        //   scrollDirection: Axis.horizontal,
        //
        //   crossAxisCount: 3,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   children: List.generate(100, (int index) {
        //     return Container(
        //       alignment: Alignment.center,
        //       color: Colors.blue,
        //       child: Text(
        //         "第${index + 1}个",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }
}
