import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key key}) : super(key: key);

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我的"),
    );
  }
}
