import 'dart:ui';
import 'package:flutter/material.dart';

import 'shared/size_fit.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
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
    print(100.rpx);
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: Text(
          "Hello world",
          style: TextStyle(fontSize: 100.0.rpx),
        ),
      ),
    );
  }
}
