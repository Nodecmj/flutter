import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis; //虚线是水平or垂直
  final double dashedWidth; //虚线里面每个小点的宽度
  final double dashedHeight; //虚线里面每个小点的高度
  final int count; //区域内小点的个数
  final Color color; //虚线的颜色

  const DashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: axis,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}
