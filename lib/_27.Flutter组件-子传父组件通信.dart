import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
父子组件通信：父传子
1.子组件定义接收属性
2.子组件在构造函数中接收参数
3.父组件传递属性给子组件
4.有状态组件在'对外的类'接收属性，'对内的类'通过widget对象获取对应属性
5.注意!:子组件定义接收属性需要使用final关键字-因为属性由父组件决定，子组件不能随意更改
*
* */
void main() {
  runApp(MainPage());
}

//父组件
//对外
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

//对内
class _MainPageState extends State<MainPage> {
  //定义数据：不能写到build内部，写到内部会每次生成一个新的数据
  List<String> _list = [
    '鱼香肉丝',
    '宫保鸡丁',
    '麻婆豆腐',
    'xxx',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('父子组件通信')),
        body: GridView.count(
          padding: const EdgeInsets.all(10),
          //设置item之间的间距
          crossAxisSpacing: 10,
          //设置item之间的间距
          mainAxisSpacing: 10,
          //横向的数量
          crossAxisCount: 2,
          children: List.generate(_list.length, (int index) {
            return Child(
              //传递属性给子组件
              foodName: _list[index],
              index: index,
              delFood: (int index) {
                print("成功调用到函数");
                _list.removeAt(index);
                //一定要写setState，才会更新UI--状态更新
                setState(() {});
              },
            ); //返回整个子组件
          }),
        ),
      ),
    );
  }
}

//子组件

class Child extends StatefulWidget {
  //定义接收属性
  final String foodName;
  final int index;
  final Function(int index) delFood;

  //在构造函数中接收属性
  const Child({
    Key? key,
    required this.foodName,
    required this.index,
    required this.delFood,
  });

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text(widget.foodName, style: TextStyle(color: Colors.white)),
        ),
        IconButton(
          color: Colors.red,
          onPressed: () {
            print('删除菜品-${widget.index}');
            widget.delFood(widget.index);
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}
