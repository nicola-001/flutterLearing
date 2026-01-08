import 'package:flutter/cupertino.dart';

void main() {
  runApp(MainPage());
}

/*
*   有状态组件的生命周期：
*创建阶段：
*   --创建：createState
*   --挂载：initState   :获取数据
*   --构建：didChangeDependencies
*   --构建：build
*更新阶段：
*   --构建：didUpdateWidget
*销毁阶段：
*   --销毁：deactivate
*   --销毁：dispose
* */

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //createState
  @override
  _MainPageState createState() {
    print('createState阶段执行');
    return _MainPageState();
  }

  //initState
  @override
  void initState() {
    print('initState阶段执行');
    super.initState();
  }

  //didChangeDependencies
  @override
  void didChangeDependencies() {
    print('didChangeDependencies阶段执行');
    super.didChangeDependencies();
    setState(() {
      print('setState阶段执行');
    });
  }
 //deactivate
  @override
  void deactivate() {
    print('deactivate阶段执行');
    super.deactivate();
  }
  //dispose
  @override
  void dispose() {
    print('dispose阶段执行');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
