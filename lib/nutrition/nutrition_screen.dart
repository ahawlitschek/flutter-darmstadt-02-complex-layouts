import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/nutrition/nutrition_app_bar.dart';
import 'package:flutterdarmstadt2/nutrition/nutrition_body.dart';
import 'package:flutterdarmstadt2/nutrition/nutrition_bottom_bar.dart';

class NutritionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NutritionAppBar(),
      body: NutritionBody(),
      bottomNavigationBar: NutritionBottomBar(),
    );
  }
}
