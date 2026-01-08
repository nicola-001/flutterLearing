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
      appBar: AppBar(
        title: Text("频道管理"),
      ),
      body: Text("内容"),
    ));
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
