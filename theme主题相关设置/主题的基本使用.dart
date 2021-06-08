import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter main",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // 1.亮度
        brightness: Brightness.light,
        // 2.primarySwatch传入不是Color，而是MaterialColor（包含了primaryColor和accentColor）
        primarySwatch: Colors.red,
        // 3.primaryColor：单独设置导航和TabBar的颜色
        primaryColor: Colors.orange,
        // 4.accentColor:单独设置FloatngActionButton\Switch\各种button之类的颜色
        accentColor: Colors.green,
        // 5.button的主题
        buttonTheme: ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow,
        ),
        // 6.Card的主题
        cardTheme: CardTheme(),
        // 7.Text的主题
        textTheme: TextTheme(
          //bodyText2未修改之前的大小
          bodyText1: TextStyle(),
          //默认的text文本大小
          bodyText2: TextStyle(color: Colors.green),
          // ...用到了找就行
        ),
        // 按钮等地方点击波纹的颜色，不想显示波纹就吧颜色设置为 transparent
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
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => ThemeTest()));
        },
      ),
    );
  }
}

class ThemeTest extends StatelessWidget {
  const ThemeTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 单独设置对应页面的主题并且还能和全局的通用 只是覆盖需要用到的样式
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.blue,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.blue,
            ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("单页面自定义主题"),
        ),
        body: Center(
          child: Text("普通文本"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.pan_tool),
          onPressed: () {},
        ),
      ),
    );
  }

// 这种方式就不能结合使用全局主题的其他样式了
// @override
// Widget build(BuildContext context) {
//   return Theme(
//     data: ThemeData(primarySwatch: Colors.blue),
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text("单页面自定义主题"),
//       ),
//       body: Center(
//         child: Text("普通文本"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.pan_tool),
//         onPressed: () {},
//       ),
//     ),
//   );
// }
}
