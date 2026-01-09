import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

//对外
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

//对内
class _MainPageState extends State<MainPage> {
  //定义接受返回值数据
  List<Map<String, dynamic>> _list = [];

  //初始化
  @override
  void initState() {
    super.initState();
    //获取数据
    _getChannels();
  }

  //获取数据
  void _getChannels() async {
    //构建实例化对象
    DioUtil utils = DioUtil();
    Response<dynamic> result = await utils.get('channels');
    Map<String, dynamic> res = result.data as Map<String, dynamic>;
    //转化成List
    List<dynamic> data = res["data"]["channels"] as List;
    //转化成as Map<String, dynamic>类型,使用cast进行转换--转换集合的类型
    _list = data.cast<Map<String, dynamic>>();
    print(_list);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("频道管理")),
        body: GridView.extent(
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 140,
          childAspectRatio: 3,
          children: List.generate(_list.length, (index) {
            return ChannelItem(
              item: _list[index],
              //在父组件中获取子组件的点击事件
              onDelete: (int index) {
                print("点击了删除按钮");
                //删除
                _list.removeAt(index);
                setState(() {});
              },
            );
          }),
        ),
      ),
    );
  }
}

//创建无状态组件
class ChannelItem extends StatelessWidget {
  // 声明接收的属性
  final Map<String, dynamic> item;

  // 1.声明子传父的函数
  final Function(int index) onDelete;

  // 2.在构造函数中赋值
  const ChannelItem({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    //堆叠布局
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(item["name"], style: TextStyle(color: Colors.white)),
          ),
        ),
        //3.调用函数
        IconButton(
          onPressed: () {
            print("点击了！");
            onDelete(item["id"]);
          },
          color: Colors.red,
          icon: Icon(Icons.delete, size: 15),
        ),
      ],
    );
  }
}

class DioUtil {
  final Dio _dio = Dio();

  DioUtil() {
    _dio.options.baseUrl = "https://geek.itheima.net/v1_0/"; // 请求地址
    _dio.options.connectTimeout = Duration(seconds: 10); // 连接超时
    _dio.options.sendTimeout = Duration(seconds: 10); // 发送超时
    _dio.options.receiveTimeout = Duration(seconds: 10); // 接收超时

    //拦截器
    _addInterceptor();
  }

  //拦截器
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (context, handler) {
          handler.next(context);
          // handler.reject()
        },
        // 响应拦截器
        onResponse: (context, handler) {
          // 判断状态码 200~300放行
          if (context.statusCode! >= 200 && context.statusCode! < 300) {
            handler.next(context);
          } else {
            handler.reject(
              DioException(requestOptions: context.requestOptions),
            );
          }
        },
        // 错误拦截器
        onError: (context, handler) {
          handler.reject(context);
        },
      ),
    );
  }

  //GET 请求
  Future<Response<dynamic>> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) {
    return _dio.get(path, queryParameters: queryParameters);
  }
}
