import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/utils.dart';

import 'colors.dart';

class AnimatedBottomBarEntry extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String text;

  final bool selected;
  final Function onTap;

  const AnimatedBottomBarEntry(
      {Key key,
      @required this.color,
      @required this.iconData,
      @required this.text,
      @required this.selected,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkColor = darken(color, 0.5);
    final textStyle = TextStyle(color: darkColor, fontWeight: FontWeight.w600);

    final textWidth = Utils.textSize(text, textStyle).width;

    return GestureDetector(
      onTap: selected ? null : onTap,
      child: ClipRect(
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          width: selected ? 16 + 24 + 8 + textWidth + 16 : 16 + 24.0 + 16,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              color: selected ? color : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(24))),
          duration: Duration(milliseconds: 300),
          child: Row(children: [
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 300),
              tween: ColorTween(
                  begin: selected ? Colors.grey.shade600 : darkColor,
                  end: selected ? darkColor : Colors.grey.shade600),
              builder: (context, Color value, child) {
                return Icon(
                  iconData,
                  color: value,
                );
              },
            ),
            const SizedBox(width: 8),
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 300),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              tween:
                  Tween<double>(begin: selected ? 0 : 1, end: selected ? 1 : 0),
              child: Text(
                text,
                style: textStyle,
              ),
            )
          ]),
        ),
      ),
    );
  }


}
