import 'package:flutter/material.dart';

class Unknown extends StatelessWidget {
  const Unknown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      body: Center(
        child: Text(
          "错误页面",
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
      ),
    );
  }
}
