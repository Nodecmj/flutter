import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String _imageUrl;

  const ImageDetail(this._imageUrl, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: _imageUrl,
            child: Image.network(_imageUrl),
          ),
        ),
      ),
    );
  }
}
