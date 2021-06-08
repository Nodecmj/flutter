import 'package:flutter/material.dart';

class AppTheme extends StatelessWidget {

  static final ThemeData norTheme = ThemeData(
    primaryColor: Colors.blue,
    splashColor: Colors.transparent,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    splashColor: Colors.transparent,
  );

  const AppTheme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
