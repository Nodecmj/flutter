import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail";
  final String msg;

  const DetailPage(this.msg, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("返回"),
              onPressed: () => _backPage(context),
            ),
            Text("$msg")
          ],
        ),
      ),
    );
  }

  _backPage(BuildContext context) {
    Navigator.of(context).pop();
  }
}
