import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBottomBar extends StatelessWidget {
  static const HEIGHT = 140.0;
  static const BUTTON_SIZE = 80.0;
  static const BUTTON_MARGIN = 4.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: const BottomBarClipper(BUTTON_SIZE + BUTTON_MARGIN),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
              child: Container(
                width: double.infinity,
                height: HEIGHT,
                color: Colors.grey.shade900.withOpacity(0.7),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.swap_calls,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
                bottom: HEIGHT - BUTTON_SIZE / 2 + BUTTON_MARGIN),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Center(
              child: Icon(
                Icons.call_end,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        )
      ],
    );
    return CustomPaint(
      size: Size(double.infinity, 100),
      painter: TestPaint(),
    );
  }
}

class XY {
  final double x;
  final double y;

  XY(this.x, this.y);
}

class TestPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final a = AutomaticNotchedShape(
        Border(),
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(99))));

    final center = size.width / 2;

    final centerXDelta = 60.0;
    final centerTopDelta = 40.0;
    final midXDelta = 20.0;
    final midTopDelta = 20.0;

    final centerPoint = XY(center, midTopDelta + centerTopDelta);
    final topLeftPoint = XY(centerPoint.x - midXDelta - centerXDelta, 0);
    final topRightPoint = XY(centerPoint.x + centerXDelta + midXDelta, 0);
    final midLeftPoint =
        XY(centerPoint.x - centerXDelta, topLeftPoint.y + midTopDelta);
    final midRightPoint =
        XY(centerPoint.x + centerXDelta, topRightPoint.y + midTopDelta);

    final path = Path();
    path.lineTo(topLeftPoint.x, topLeftPoint.y);
    path.lineTo(midLeftPoint.x, midLeftPoint.y);

    path.cubicTo(midLeftPoint.x, midLeftPoint.y + 20, centerPoint.x - 60,
        centerPoint.y, centerPoint.x, centerPoint.y);

    path.cubicTo(midLeftPoint.x, midLeftPoint.y + 20, centerPoint.x - 60,
        centerPoint.y, midRightPoint.x, midRightPoint.y);

    //path.lineTo(centerPoint.x, centerPoint.y);
    path.lineTo(midRightPoint.x, midRightPoint.y);
    path.lineTo(topRightPoint.x, topRightPoint.y);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    final c = CircularNotchedRectangle();

    canvas.drawPath(
        c.getOuterPath(Rect.fromLTRB(0, 0, size.width, size.height),
            Rect.fromCenter(center: Offset(center, 0), width: 92, height: 92)),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BottomBarClipper extends CustomClipper<Path> {
  const BottomBarClipper(this.radius);

  final circularNotchedRectangle = const CircularNotchedRectangle();
  final double radius;

  @override
  Path getClip(Size size) {
    return circularNotchedRectangle.getOuterPath(
        Rect.fromLTRB(0, 0, size.width, size.height),
        Rect.fromCenter(
            center: Offset(size.width / 2, 0), width: 92, height: 92));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
