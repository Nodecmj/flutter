import 'package:flutter/material.dart';

class About extends StatelessWidget {
  static const routeName = "/about";

  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String mssage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mssage),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop("about返回的消息");
                },
                child: Text("返回首页")),
          ],
        ),
      ),
    );
  }
}
