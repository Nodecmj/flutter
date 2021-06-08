import 'package:flutter/material.dart';
import 'subject_content.dart';

class Subject extends StatefulWidget {
  const Subject({Key key}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubjectContent(),
    );
  }
}
