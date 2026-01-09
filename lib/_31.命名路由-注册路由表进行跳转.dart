import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

//命名路由
/*
* 场景:应用页面增多后，使用命名路提升代码可维护性。
用法:需要先在 MaterialApp中注册一个路由表(routes)并设置initialRoute(首页)
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
              Navigator.pushNamed(context, "/detail");
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
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
