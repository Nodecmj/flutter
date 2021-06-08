import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

final event = EventBus();

main() => runApp(MyApp());

class UserInfo {
  final String nickName;
  final int age;

  UserInfo(this.nickName, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return "$nickName--$age";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("手势检测"),
        ),
        body: buildCenter(),
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: GestureDetector(
        // onTapDown: (details) {
        //   print("点击了$details");
        // },
        // onDoubleTap: () {
        //   print("双击666");
        // },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.orange,
          child: Column(
            children: [
              Msg(),
              ElevatedButton(
                onPressed: () {
                  var userInfo = UserInfo("程明杰", 22);
                  event.fire(userInfo);
                },
                child: Icon(Icons.update),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Msg extends StatefulWidget {
  const Msg({Key key}) : super(key: key);

  @override
  _MsgState createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  String msg = "你好啊程明杰";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    event.on<UserInfo>().listen((event) {
      setState(() {
        msg = "姓名：${event.nickName},年龄:${event.age}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(msg);
  }
}
