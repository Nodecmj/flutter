import 'package:flutter/material.dart';
import 'mall_content.dart';

class Mall extends StatefulWidget {
  const Mall({Key key}) : super(key: key);

  @override
  _MallState createState() => _MallState();
}

class _MallState extends State<Mall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MallContent(),
    );
  }
}
