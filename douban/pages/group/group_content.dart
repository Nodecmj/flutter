import 'package:flutter/cupertino.dart';

class GroupContent extends StatefulWidget {
  const GroupContent({Key key}) : super(key: key);

  @override
  _GroupContentState createState() => _GroupContentState();
}

class _GroupContentState extends State<GroupContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("小组"),
    );
  }
}
