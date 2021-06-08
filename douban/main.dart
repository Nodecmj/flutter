import 'package:flutter/material.dart';
import 'pages/main/main_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent, //点击波纹效果改为透明
      ),
      home: MainPage(),
    );
  }
}
