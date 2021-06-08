import 'package:flutter/material.dart';
import 'package:hello_flutter/douban/model/home_model.dart';
import 'home_movie_item.dart';
import 'package:hello_flutter/service/home_request.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.requestList().then((value) {
      setState(() {
        movies.addAll(value);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return HomeMovieItem(movies[index]);
      },
    );
  }
}
