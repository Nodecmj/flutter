import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/animation/pages/ImageDetail.dart';
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          itemBuilder: (context, index) {
            String imgUrl = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (ctx, anim1, anim2) {
                      return FadeTransition(
                        opacity: anim1,
                        child: ImageDetail(imgUrl),
                      );
                    },
                  ),
                );
              },
              child: Hero(
                tag: imgUrl,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pool),
        onPressed: () {
          // 自定义动画封装
          Navigator.of(context).push(LeftToRightPageRoute(ModalPage()));
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
