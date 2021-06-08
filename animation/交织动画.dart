import 'dart:math';

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
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  Animation sizeAnim;
  Animation colorAnim;
  Animation opacityAnim;
  Animation radiansAnim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 1.构建动画
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      // lowerBound: 50,
      // upperBound: 150,
    );
    // 2.设置Curve的值
    // 如果想把_controller的值传到curve里面 那么lowerBound和upperBound 必须是0到1
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    );
    // 3.Tween
    // 3.1.创建size的tween
    sizeAnim = Tween(begin: 0.0, end: 200.0).animate(animation);
    // 3.2.创建color的tween
    colorAnim =
        ColorTween(begin: Colors.blue, end: Colors.orange).animate(_controller);
    // 3.3.创建opacity的tween
    opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    // 3.4.创建radians的tween
    radiansAnim = Tween(begin: 0.0, end: pi * 2).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
      //如果当前动画完成 那么就倒播
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        //  如果动画回到最初的状态 也就是倒播到原点 那么久继续正播 就可以形成闭环
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Opacity(
              opacity: opacityAnim.value,
              child: Transform(
                transform: Matrix4.rotationZ(radiansAnim.value),
                alignment: Alignment.center,
                child: Container(
                    width: sizeAnim.value,
                    height: sizeAnim.value,
                    color: colorAnim.value),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
            return;
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

/*
    * 1.Animation: 抽象类
    *   * 监听动画值的改变
    *   * 监听动画状态的改变
    *   * value
    *   * status
    *
    * 2.AnimationController继承自Animation
    *   * vsync：同步信号(this -> with SingleTickerProviderStateMixin)
    *   * forward():向前执行动画
    *   * reverse():反转执行动画
    * 3.CurvedAnimation:
    *   * 作用:设置动画执行的速率(速度曲线)
    * 4.Tween:设置动画执行的value范围
    *   * begin:开始值
    *   * end:结束值
    * */
// final controller = AnimationController(vsync: this);
// final animation = CurvedAnimation(parent: controller,curve: Curves.elasticInOut);
// final valueQAnimation = Tween(begin:100,end: 200).animate(animation);
