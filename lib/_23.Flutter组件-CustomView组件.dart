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
        //自定义滚动容器
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "轮播图",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                height: 260,
              ),
            ),
            //设置间距
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            //给delegate属性赋值一个继承SliverPersistentHeaderDelegate的对象实力
            SliverPersistentHeader(
              delegate: _StickyCategory(),
              pinned: true, //固定吸顶
            ),
            //设置间距
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            // 放置长列表
            SliverList.separated(
              itemCount: 100,
              // 当前构建上下文
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.blue,
                  child: Text(
                    '列表项${index + 1}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
              //分割线的索引(第几条分割线)：在每个列表之间插入一个高度为20的空白间距
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//内部组件
class _StickyCategory extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // 返回结构
    return Container(
      color: Colors.white,
      child: ListView.builder(
        //滚动方向
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            color: Colors.blue,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Text(
              '分类${index + 1}',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  @override
  // 最大展开高度
  double get maxExtent => 80;

  @override
  // 最小折叠高度
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要重新构建
    return false;
  }
}
