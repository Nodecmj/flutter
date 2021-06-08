import 'package:flutter/material.dart';
import 'package:hello_flutter/douban/model/home_model.dart';
import 'package:hello_flutter/douban/widgets/dashed_line.dart';
import 'package:hello_flutter/douban/widgets/star_grade.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  const HomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 8, color: Colors.black12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(
            height: 10,
          ),
          buildContent(),
          SizedBox(
            height: 10,
          ),
          Text("333"),
        ],
      ),
    );
  }

  //头部布局
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color.fromARGB(255, 238, 205, 144),
      ),
      child: Text(
        "No.${movie.ranking}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  //主体布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildImage(),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: IntrinsicHeight(
          child: Row(
            children: [
              buildInfo(),
              buildContainerLine(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add_alert_rounded), Text("想看")],
              )
            ],
          ),
        )),
      ],
    );
  }

  Container buildContainerLine() {
    return Container(
        height: 120,
        child: DashedLine(
          axis: Axis.vertical,
          dashedWidth: 1,
          dashedHeight: 6,
        ));
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie.imageURL,
        height: 150,
      ),
    );
  }

  Widget buildInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInfoTitle(),
          SizedBox(
            height: 4,
          ),
          buildInfoStar(),
        ],
      ),
    );
  }

  Widget buildInfoStar() {
    return Row(
      children: [
        StarGrade(
          rating: movie.rank,
          size: 20,
          unselectedColor: Colors.black12,
          selectedColor: Colors.orange,
        ),
        Text("${movie.rank}"),
      ],
    );
  }

  Widget buildInfoTitle() {
    return Row(
      children: [
        Icon(
          Icons.play_circle_outline,
          color: Colors.deepOrange,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "${movie.title}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
