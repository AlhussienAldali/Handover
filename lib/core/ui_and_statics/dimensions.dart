import 'package:flutter/material.dart';

class Dimensions {
  static late double mainScreenBarHeight;
  static late double mainScreenBigBarHeight;
  static late double mainScreenBarWidth;
  static late double mainScreenContainerRadios;

  static late double mainPadding;
  static late double smallPadding;
  static late double mediumPadding;
  static late double timeLinePadding;
  static late double iconSize;

  static late double profileRadios;
  static late double profileNamePadding;

  static late double submitHeight;
  static late double submitWidth;
  static late double submitRounded;

  static late double ratingIconSize;

  static void initiateValues(BuildContext context) {
    mainScreenBarHeight = MediaQuery.of(context).size.height * 0.37;
    mainScreenBigBarHeight = MediaQuery.of(context).size.height * 0.65;
    mainScreenBarWidth = MediaQuery.of(context).size.width;
    profileRadios = MediaQuery.of(context).size.height * 0.1;
    profileNamePadding = MediaQuery.of(context).size.height * 0.12;
    smallPadding = MediaQuery.of(context).size.height * 0.01;
    mediumPadding = MediaQuery.of(context).size.height * 0.05;
    mainPadding = MediaQuery.of(context).size.height * 0.06;
    iconSize = MediaQuery.of(context).size.height * 0.045;
    mainScreenContainerRadios = MediaQuery.of(context).size.height * 0.05;
    submitHeight = MediaQuery.of(context).size.height * 0.06;
    submitWidth = MediaQuery.of(context).size.height * 0.3;
    submitRounded = MediaQuery.of(context).size.height * 0.03;
    ratingIconSize = MediaQuery.of(context).size.height * 0.048;
    timeLinePadding = MediaQuery.of(context).size.height * 0.004;
  }
}
