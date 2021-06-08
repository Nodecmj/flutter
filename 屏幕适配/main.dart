import 'dart:ui';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1.获取屏幕分辨率
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    print("分辨率:$physicalWidth * $physicalHeight");
    // 2.获取dpr
    final dpr = window.devicePixelRatio;

    // 3.屏幕宽度和高度
    final width = physicalWidth / dpr;
    final height = physicalHeight / dpr;
    print("屏幕宽度和高度:$width * $height");

    // 4.状态栏高度
    final statusHeight = window.padding.top / dpr;
    print("状态栏高度$statusHeight");

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
    );
  }
}
