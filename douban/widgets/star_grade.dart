import 'package:flutter/material.dart';

class StarGrade extends StatefulWidget {
  final double rating; //当前评分
  final double maxRating; //最大评分
  final int count; //星个数
  final double size; //icon大小
  final Color unselectedColor; //未选中的颜色
  final Color selectedColor; //选中的颜色
  final IconData unselectedIcon; //未选中的icon
  final IconData selectedIcon; //选中的icon

  const StarGrade({
    Key key,
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    this.unselectedIcon = Icons.star_border,
    this.selectedIcon = Icons.star,
  }) : super(key: key);

  @override
  _StarGradeState createState() => _StarGradeState();
}

class _StarGradeState extends State<StarGrade> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar()),
      ]),
    );
  }

  List<Widget> buildSelectedStar() {
    List<Widget> startList = [];
    final star = Icon(widget.selectedIcon,
        color: widget.selectedColor, size: widget.size);
    //当前评分所占多少星（有小数 未取整）
    double extraSelectStarCount =
        widget.rating / (widget.maxRating / widget.count);
    //完整的星个数（向下取整 填充满的星个数）
    int fillStarCount = extraSelectStarCount.floor();
    //评分小数的部分，不足一星时所需要的宽度
    double leftWidth = (extraSelectStarCount - fillStarCount) * widget.size;

    for (var i = 0; i < fillStarCount; i++) {
      startList.add(star);
    }
    startList.add(ClipRect(
      clipper: starClipper(leftWidth),
      child: star,
    ));

    if(startList.length>widget.count){
      return startList.sublist(0,widget.count);
    }
    return startList;
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return Icon(widget.unselectedIcon,
          color: widget.unselectedColor, size: widget.size);
    });
  }
}

class starClipper<T> extends CustomClipper<Rect> {
  final width;

  starClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(starClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}