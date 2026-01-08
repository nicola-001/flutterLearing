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
  //声明变量
  PageController _controller = PageController();

  //当前激活索引
  int _currentIndex = 0;

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
                height: 260,
                child: PageView.builder(
                  //绑定控制器
                  controller: _controller,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: Text(
                            '轮播图${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        //设置轮播图下面的小圆点
                        Positioned(
                          //居中显示
                          left: 0,
                          right: 0,
                          //在底部显示
                          bottom: 0,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(10, (index) {
                                //点击事件
                                return GestureDetector(
                                  //切换
                                  onTap: () {
                                    _currentIndex = index;
                                    //设置当前索引
                                    // _controller.jumpToPage(index);
                                    _controller.animateToPage(
                                      index,
                                      duration: Duration(microseconds: 200),
                                      curve: Curves.linear,
                                    );
                                    //设置当前索引
                                    setState(() {});
                                    print('点击了第${index + 1}个小圆点');
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      //判断当前的索引是否匹配当前索引，若匹配则变成红色
                                      color: _currentIndex == index
                                          ? Colors.red
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          //设置小圆点距离底部的间距
                          height: 40,
                        ),
                      ],
                    );
                  },
                ),
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
