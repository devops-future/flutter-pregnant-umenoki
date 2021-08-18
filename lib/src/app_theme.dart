///
/// Project name : Umenoki
/// Description : Theme static
/// Author : Xiao
/// Date : 2020-06-03
///

import 'package:flutter/material.dart';

class AppTheme {
  static const Color nearlyPink = Color(0xFFF37D86);                  // bottom nav bar background color
  static const Color nearlyDarkRed = Color(0xFF9F2F3A);               // bottom nav bar text color
  static const Color nearlyRed = Color(0xFFF37D86);
  static const Color nearlyDark = Color(0xFF707070);
  static const Color nearlyGray = Color(0xFFFFE3EA);
  static const Color nearlyBrown = Color(0xFFEABC9E);
  static const Color nearlyBlack = Color(0xFF623F06);
  static const Color nearlyWhite = Color(0xFFFFEAEA);
  static const Color nearlyOrange = Color(0xFFFE9E6F);

  static const double iconSize = 50.0;
  static const String fontName = "Avenir";
  static const TextTheme textTheme = TextTheme(

  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontSize: 22.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: fontName,
    fontSize: 17.0,
    color: nearlyDark,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: fontName,
    fontSize: 17.0,
  );

  static const TextStyle switchText = TextStyle(
    fontFamily: fontName,
    fontSize: 16.0,
    color: Colors.white,
  );
  
  static const TextStyle tabText = TextStyle(
    fontFamily: fontName,
    fontSize: 12.0,
    color: nearlyOrange,
  );
}