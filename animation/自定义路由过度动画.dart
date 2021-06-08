import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/modal_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter main",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: Text("Hello world"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pool),
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (ctx) {
          //       return ModalPage();
          //     },
          //     fullscreenDialog: true,
          //   ),
          // );

          // 渐变的路由动画
          // Navigator.of(context).push(PageRouteBuilder(
          //   pageBuilder: (ctx, anim1, anim2) {
          //     return FadeTransition(
          //       opacity: anim1,
          //       child: ModalPage(),
          //     );
          //   },
          // ));

          // 自定义路由动画
          // Navigator.of(context).push(PageRouteBuilder(
          //     pageBuilder: (ctx, anim1, anim2) {
          //   return FadeTransition(
          //     opacity: anim1,
          //     child: ModalPage(),
          //   );
          // }, transitionsBuilder: (BuildContext context,
          //         Animation<double> animation,
          //         Animation<double> secondaryAnimation,
          //         Widget child) {
          //   return SlideTransition(
          //     position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
          //         .animate(animation),
          //     child: child,
          //   );
          // }));

          // 自定义动画封装
          Navigator.of(context).push(LeftToRightPageRoute(ModalPage()));

          // 无论ios还是android 都是从左往右的路由动画
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (BuildContext context) {
          //       return ModalPage();
          //     },
          //   ),
          // );
        },
      ),
    );
  }
}

class LeftToRightPageRoute extends PageRouteBuilder {
  final Widget widget;

  LeftToRightPageRoute(this.widget)
      : super(
            pageBuilder: (ctx, anim1, anim2) => widget,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(animation),
                child: widget,
              );
            });
}
