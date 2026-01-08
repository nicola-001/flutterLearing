import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MainPage());
}
class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "无状态组件",
        home: Scaffold(
          appBar: AppBar(
            title: Text("头部区域"),
          ),
          body: Container(
            child: Center(
              child: Text("中部区域"),
            ),
          ),
          bottomNavigationBar: Container(
            height: 80,
            child: Center(
              child: Text("底部区域"),
            ),
          ),
        ),
    );
  }

}