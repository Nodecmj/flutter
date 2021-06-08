import 'package:flutter/material.dart';

class MallContent extends StatefulWidget {
  const MallContent({Key key}) : super(key: key);

  @override
  _MallContentState createState() => _MallContentState();
}

class _MallContentState extends State<MallContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("市集"),
    );
  }
}
