import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "测试123",
    theme: ThemeData(scaffoldBackgroundColor: Colors.blueAccent),
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
  ));
}
