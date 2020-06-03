import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/nutrition/styles.dart';

class NutritionPieChartPainter extends CustomPainter {
  final double percentage;

  NutritionPieChartPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final paintPie = Paint()
      ..color = kNutritionRed.withOpacity(0.25)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    final startAngle = -5 * pi / 4;
    final fullSweepAngle = 6 * pi / 4;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 24;
    final percentageSweepAngle = fullSweepAngle * percentage;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        fullSweepAngle, false, paintPie);

    final arcShadowWidth = 8;
    final percentageOffsetOnInnerArc = _calculatePointOnArc(
        center, startAngle + percentageSweepAngle, radius - arcShadowWidth);
    final shadowPath = Path()
      ..arcTo(Rect.fromCircle(center: center, radius: radius + arcShadowWidth),
          startAngle, percentageSweepAngle, true)
      ..lineTo(percentageOffsetOnInnerArc.dx, percentageOffsetOnInnerArc.dy)
      ..arcTo(Rect.fromCircle(center: center, radius: radius - arcShadowWidth),
          startAngle + percentageSweepAngle, -percentageSweepAngle, false)
      ..arcToPoint(
          _calculatePointOnArc(center, startAngle, radius + arcShadowWidth),
          radius: Radius.circular(arcShadowWidth / 2));

    canvas.drawShadow(shadowPath, Colors.red.withOpacity(0.4), 8, true);

    paintPie.color = kNutritionRed;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        percentageSweepAngle, false, paintPie);

    Paint paintTicks = Paint()
      ..color = Colors.red.withOpacity(0.6)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (double angle = startAngle;
        angle <= startAngle + fullSweepAngle;
        angle += fullSweepAngle / 20) {
      canvas.drawLine(
        _calculatePointOnArc(center, angle, radius + 16),
        _calculatePointOnArc(center, angle, radius + 18),
        paintTicks,
      );
    }

    final paintValueCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final valueCircleCenter =
        _calculatePointOnArc(center, startAngle + percentageSweepAngle, radius);

    final valueCircleShadowPath = Path()
      ..addOval(
          Rect.fromCenter(center: valueCircleCenter, height: 32, width: 32));

    canvas.drawShadow(
        valueCircleShadowPath, Colors.grey.withOpacity(0.6), 2, true);

    canvas.drawCircle(valueCircleCenter, 16, paintValueCircle);
    paintValueCircle.color = Colors.red;
    canvas.drawCircle(valueCircleCenter, 5, paintValueCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  Offset _calculatePointOnArc(Offset center, double angle, double radius) =>
      Offset(
        center.dx + cos(angle) * radius,
        center.dy + sin(angle) * radius,
      );
}
