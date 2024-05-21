import 'package:flutter/material.dart';

class CustomColors {
  static const Color customTransparent = Color(0x00000000);
  static Color customGrey600 = Colors.grey[600]!;
  static const Color customBlueCard = Color(0xFF0C4F80);
  static const Color customBlueCardHistory = Color(0xFF062E4A);
  static const Color customWhite = Color(0xFFffffff);
  static const Color customBlue = Color(0xFF0C4F7F);
  static const Color customBlueDark = Color.fromARGB(255, 3, 38, 63);
  static const Color customBlueAccent = Color(0xFF0094FF);
  static const Color customBlueOpacity = Color(0xFF0281DE);
  static const Color customRed = Color(0xFFFB0000);
  static const Color customYellow = Color(0xFFFFC907);
  static const Color customGreen = Color(0xFF40C512);
  static const Color customGreenOpacity = Color.fromARGB(181, 63, 197, 18);
  static const Color customCardTop = Color(0xFF00005E);
  static const Color customBlack = Color(0xFF000000);
  static const RadialGradient customBackgroundGradient = RadialGradient(
    colors: [customBlueOpacity, CustomColors.customBlue],
    radius: 0.75,
  );

  static const background = BoxDecoration(gradient: customBackgroundGradient);
}