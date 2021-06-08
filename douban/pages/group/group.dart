import 'package:flutter/material.dart';
import 'group_content.dart';

class Group extends StatefulWidget {
  const Group({Key key}) : super(key: key);

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupContent(),
    );
  }
}
