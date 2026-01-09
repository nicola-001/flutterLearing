import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

/*
* 路由管理-传递参数
作用:通过路由传递参数是实现页面间数据通信的常用方式
传递参数(命名路由):Navigator.pushNamed(context,地址,arguments:{参数})
接收参数(命名路由):ModalRoute.of(context)?.settings.arguments
接收时机:initState获取不到路由参数，放置在Future.microtask(异步微任务)中
* */
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ListPage(),
      //设置首页
      initialRoute: "/list",
      // 注册路由表
      routes: {
        "/list": (context) => ListPage(),
        "/detail": (context) => DetailPage(),
      },
    );
  }
}

//有状态组件--列表页
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("列表页")),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print("跳转到详情页");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DetailPage()),
              // );
              //1.通过命名参数传递数据
              Navigator.pushNamed(
                context,
                "/detail",
                arguments: {"id": index + 1},
              );
            },
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.only(top: 10),
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "第${index + 1}个",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

//详情页
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //接收参数
  String _id = "";

  //在Future.microtask的异步任务中接收数据，定义接收并赋值参数使用setState()方法
  @override
  void initState() {
    super.initState();
    //获取路径参数
    Future.microtask(() {
      //获取路由参数
      var arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      print("接收到的参数为：$arguments");
      _id = arguments["id"].toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页-${_id}")),
      body: Center(
        child: TextButton(
          onPressed: () {
            print("返回上一页");
            // Navigator.pop(context);
            Navigator.pushNamed(context, "/list");
          },
          child: Text("返回上一个页面"),
        ),
      ),
    );
  }
}
