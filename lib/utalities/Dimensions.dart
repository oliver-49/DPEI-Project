import 'package:flutter/material.dart';
class Dimensions {
final double screenHeight;
  final double screenWidth;

  Dimensions(BuildContext context)
      : screenHeight = MediaQuery.of(context).size.height,
        screenWidth = MediaQuery.of(context).size.width;

  double get pageView => screenHeight / 2.64;
  double get pageViewContainer => screenHeight / 3.84;
  double get personalCardHeight=> screenWidth -58;
  double get pageViewTextContainer => screenHeight / 7.03;
  //dynamic height padding and margin
  double get height10 => screenHeight / 87.4;
  double get height15 => screenHeight / 56.27;
  double get height20 => screenHeight / 44.2;
  double get height30 => screenHeight / 28.43;
  double get height45 => screenHeight / 19.42;
  //dyna mic font size
  double get font12 => screenHeight / 72.75;
  double get font15 => screenHeight / 57.7;
  double get font20 => screenHeight / 43.7;
  double get font25 => screenHeight / 34.61;
}