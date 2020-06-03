import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredIconButton extends StatelessWidget {
  final Function onTap;
  final Widget icon;

  const BlurredIconButton({Key key, this.onTap, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Container(
        width: 60,
        height: 60,
        color: Colors.grey.shade600.withOpacity(0.7),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Center(child: icon),
            ),
          ),
        ),
      ),
    );
  }
}
