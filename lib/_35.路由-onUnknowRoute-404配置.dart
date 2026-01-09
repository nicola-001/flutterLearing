import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
*
路由管理-动态路由与高级控制
场景:更复杂的场景，如需根据参数动态生成页面，或实现路由拦截，
可以使用onGenerateRoute和onUnknownRoute
路由表中没有配置会进入onGenerateRoute,若这里面也没有会进入onUnknownRoute -对应的404页面
* */
void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    //使用命名路由
    return MaterialApp(
      //首页路由
      initialRoute: '/goodsList',
      routes: {
        //购物车和登录不在路由表中编写
        '/goodsList': (context) => GoodsList(),
      },
      onGenerateRoute: (settings) {
        // 判读去的是不是购物车列表页
        if (settings.name == '/cardList') {
          bool isLogin = false;
          if (isLogin) {
            return MaterialPageRoute(builder: (context) => CardList());
          } else {
            return MaterialPageRoute(builder: (context) => LoginPage());
          }
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}

//商品列表组件
class GoodsList extends StatefulWidget {
  const GoodsList({super.key});

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cardList');
          },
          child: Text("加入购物车"),
        ),
      ),
    );
  }
}

//购物车列表组件
class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车列表')),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text("去购物")),
      ),
    );
  }
}

//登录组件
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录组件')),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/qweasd');
          },
          child: Text("去登录"),
        ),
      ),
    );
  }
}

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('404')),
      body: Center(
        child: Image.asset("lib/images/favicon.jpg", width: 100, height: 100,),
      )
    );
  }
}
