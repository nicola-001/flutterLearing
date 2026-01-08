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
  //声明控制器
  //滚动条的控制器
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("demo")),
        body: Stack(
          children: [
            //一次性构建所有组件   ListView只加载可视区域的内容
            SingleChildScrollView(
              controller: _controller,
              padding: EdgeInsets.all(20),
              child: Column(
                children: List.generate(100, (index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 80,
                    color: Colors.blue,
                    child: Text(
                      "我是第${index + 1} 个",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    alignment: Alignment.center,
                  );
                }),
                // children: [
                //   Container(
                //     width: double.infinity,
                //     height: 80,
                //     color: Colors.blue,
                //     child: Text('我是第一个', style: TextStyle(color: Colors.white, fontSize: 20),),
                //     alignment: Alignment.center,
                //   ),
                // ],
              ),
            ),
            //放置堆叠组件
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  print("去底部");
                  // _controller.jumpTo(_controller.position.maxScrollExtent);
                  _controller.animateTo(
                    _controller.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "去底部",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  print("去顶部");
                  // _controller.jumpTo(0);
                  _controller.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "去顶部",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
        // 让单个自组建具备滚动能力：SingleChildScrollView
        // body: SingleChildScrollView(
        //   padding: EdgeInsets.all(20),
        //   child: Column(
        //     children: List.generate(100, (index) {
        //       return Container(
        //         margin: EdgeInsets.only(top: 10),
        //         width: double.infinity,
        //         height: 80,
        //         color: Colors.blue,
        //         child: Text(
        //           "我是第${index + 1} 个",
        //           style: TextStyle(color: Colors.white, fontSize: 20),
        //         ),
        //         alignment: Alignment.center,
        //       );
        //     }),
        //     // children: [
        //     //   Container(
        //     //     width: double.infinity,
        //     //     height: 80,
        //     //     color: Colors.blue,
        //     //     child: Text('我是第一个', style: TextStyle(color: Colors.white, fontSize: 20),),
        //     //     alignment: Alignment.center,
        //     //   ),
        //     // ],
        //   ),
        // ),
      ),
    );
  }
}
