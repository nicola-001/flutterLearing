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
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("登录demo")),
        body: Container(
          padding: EdgeInsets.all(50),
          color: Colors.white,
          child: Column(
            children: [
              TextField(
                controller: _phoneController,
                //在提交的时候获取输入框的值(回车会执行这个逻辑)
                onSubmitted: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "请输入账号",
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
              SizedBox.fromSize(size: Size.fromHeight(20)),
              TextField(
                controller: _codeController, //点击时能够获取到值
                onChanged: (value) {
                  //在输入框的值发生变化时触发
                  print(value);
                },
                obscureText: true, //不显示实际内容，用来做密码提示框
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "请输入密码",
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: TextButton(
                  onPressed: () {
                    print('121--: ${_phoneController.text}');
                    print('122--: ${_codeController.text}');
                  },
                  child: Text("登录", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
