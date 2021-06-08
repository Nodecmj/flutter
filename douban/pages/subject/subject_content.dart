import 'package:flutter/material.dart';

class SubjectContent extends StatefulWidget {
  const SubjectContent({Key key}) : super(key: key);

  @override
  _SubjectContentState createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("书影音"),
    );
  }
}
