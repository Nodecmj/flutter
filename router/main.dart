import 'package:flutter/material.dart';
import 'unknown.dart';
import 'about.dart';
import 'detail.dart';

import 'routes.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 路由
      routes: MJRoute.routes,
      // 路由默认显示的首页
      initialRoute: MJRoute.initialRoute,
      // 根据name判断进入对应的路由页面 进行个性化配置
      onGenerateRoute: MJRoute.onGenerateRoute,
      // 如果跳转到没有的页面或者路径错误的页面 那么就执行这个钩子函数
      onUnknownRoute: MJRoute.onUnknownRoute,
    );
  }
}

class HomePage extends StatelessWidget {
  static const routeName = "/";

  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由的用法"),
      ),
      body: NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              child: Text("跳转详情"), onPressed: () => _jumpPage(context)),
          ElevatedButton(
              child: Text("跳转关于"), onPressed: () => _jumpAboutPage(context)),
          ElevatedButton(
              child: Text("跳转详情2"), onPressed: () => _jumpPage2(context)),
          ElevatedButton(
              child: Text("跳转到没有的页面"), onPressed: () => _jumpUnknown(context)),
        ],
      ),
    );
  }

  _jumpUnknown(BuildContext context) {
    Navigator.of(context).pushNamed("2312312");
  }

  _jumpAboutPage(BuildContext context) {
    final Future result =
        Navigator.of(context).pushNamed(About.routeName, arguments: "传参到关于页");
    result.then((value) => print(value));
  }

  _jumpPage2(BuildContext context) {
    // 1.普通的跳转方式。（路由跳转 外层必须包裹一个route类。官方推荐使用MaterialPageRoute：安卓默认从下往上出现，ios默认从右往左出现）
    // 传递参数：通过构造器直接传参即可
    Navigator.of(context).pushNamed(DetailPage.routeName,
        arguments: "这个是pushNamed传参 如果当前类必须穿参的话,就用当前方式");
  }

  _jumpPage(BuildContext context) {
    // 1.普通的跳转方式。（路由跳转 外层必须包裹一个route类。官方推荐使用MaterialPageRoute：安卓默认从下往上出现，ios默认从右往左出现）
    // 传递参数：通过构造器直接传参即可
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return DetailPage("构造器传参");
        },
      ),
    );
  }
}
