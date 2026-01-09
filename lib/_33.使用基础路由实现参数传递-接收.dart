import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

/*
基本路由适合页面不多、跳转逻辑简单的场景
* */
//无状态组件--路由跳转Material风格，只能有一个MaterialApp
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListPage());
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(id: index + 1),
                ),
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

//详情页--在对外组件中定义接受参数（对外组件定义接口，对内组件实现功能）
class DetailPage extends StatefulWidget {
  //接收参数
  final int? id;

  const DetailPage({super.key, this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("接收到的参数是：${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页--${widget.id}")),
      body: Center(
        child: TextButton(
          onPressed: () {
            print("返回上一页");
            Navigator.pop(context);
          },
          child: Text("返回上一个页面"),
        ),
      ),
    );
  }
}
