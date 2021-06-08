import 'package:flutter/material.dart';
import 'package:hello_flutter/service/http_request.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("网络请求第三方库 Dio测试"),
          ),
          body: HomePageBody(),
        ));
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key key,
  }) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    //  创建dio对象
    //   final dio = new Dio();
    //   dio.get("https://httpbin.org/get").then((value){
    //     print("请求的结果: $value");
    //   });
    HttpRequest.get("/get",
        parma: {"name": "cmj"}).then((value) => print("封装的request结果$value"));
    // httpRequest
    //     .post("/post",
    //         parma: {"name": "hello cmj"},
    //         inter: InterceptorsWrapper(onRequest: (options, handler) {
    //           print("用户自定义请求拦截");
    //           return handler.next(options);
    //         }, onResponse: (e, handler) {
    //           print("用户自定义响应拦截");
    //           return handler.next(e);
    //         }, onError: (e, handler) {
    //           print("用户自定义报错拦截");
    //           return handler.next(e);
    //         }))
    //     .then((value) => print("封装的request结果$value"));
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
