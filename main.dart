import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/**
 *  1.创建自己需要共享的数据
 *  2.在应用程序的顶层创建changeNotifierProvider
 *  3.在其他位置使用共享的数据
 *  */

main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

  Scaffold HomePage() {
    return Scaffold(
      appBar: AppBar(title: Text("状态管理")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowData1(),
            ShowData2(),
          ],
        ),
      ),
    );
  }
}

class ShowData2 extends StatelessWidget {
  const ShowData2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Text(
        "当前计数:100",
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}

class ShowData1 extends StatelessWidget {
  const ShowData1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      child: Text(
        "当前计数:100",
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
