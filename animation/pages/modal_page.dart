import 'package:flutter/material.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("ModalPage"),
      ),
      body: Center(
        child: Text("ModalPage"),
      ),
    );
  }
}
