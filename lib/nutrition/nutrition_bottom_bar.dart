import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/nutrition/styles.dart';

class NutritionBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kNutritionGreenDark,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: kNutritionGreen,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: kNutritionRed,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Icon(Icons.blur_circular, color: Colors.white),
            Icon(Icons.flash_on, color: Colors.white),
            Icon(Icons.settings, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
