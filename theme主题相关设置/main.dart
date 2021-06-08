import 'package:flutter/material.dart';
import 'package:hello_flutter/theme%E4%B8%BB%E9%A2%98%E7%9B%B8%E5%85%B3%E8%AE%BE%E7%BD%AE/app_theme.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter main",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.norTheme,
      darkTheme: AppTheme.darkTheme,
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
