import 'package:flutter/material.dart';

class NutritionDataBar extends StatelessWidget {
  final Widget label;
  final double upperHeight;
  final double lowerHeight;

  final double upperPercentage;
  final double lowerPercentage;

  final double barWidth;
  final double holeSize;

  final Color upperColor;
  final Color lowerColor;

  const NutritionDataBar(
      {Key key,
        this.label,
        this.upperHeight = 112,
        this.lowerHeight = 32,
        this.upperPercentage = 1.0,
        this.lowerPercentage = 1.0,
        this.barWidth = 7,
        this.holeSize = 8,
        this.upperColor = const Color(0xFFEF7662),
        this.lowerColor = const Color(0xFFF8CE6C)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        label,
        const SizedBox(height: 8),
        SizedBox(height: lowerHeight * (1 - lowerPercentage)),
        Container(
          width: barWidth,
          height: lowerHeight * lowerPercentage,
          decoration: BoxDecoration(
            color: lowerColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        SizedBox(height: holeSize),
        Container(
          width: barWidth,
          height: upperHeight * upperPercentage,
          decoration: BoxDecoration(
            color: upperColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        SizedBox(height: upperHeight * (1 - upperPercentage)),
      ],
    );
  }
}