import 'package:flutter/material.dart';

class Dimensions {

  static void initiateValues(BuildContext context) {
    mainScreenBarHeight = MediaQuery.of(context).size.height * 0.37;
    mainScreenBigBarHeight = MediaQuery.of(context).size.height * 0.6;

    mainScreenBarWidth = MediaQuery.of(context).size.width;
    profileRadios = MediaQuery.of(context).size.height * 0.1;
  }

  static const double mainScreenContainerRadios = 50;
  static double? profileRadios;
  static const double mainPadding = 50;
  static const double simplePadding = 20;
  static const double edgeRounding = 20;
  static const double smallPadding = 5;
  static const double mediumPadding = 25;
  static const double iconSize = 35;
  static const double submitWidth = 200;
  static const double submitHeight = 50;
  static const double submitRounded=30;

  static double? mainScreenInsideStackHigh;
  static double? mainScreenBarHeight;
  static double? mainScreenBigBarHeight;
  static double? mainScreenBarWidth;
}
