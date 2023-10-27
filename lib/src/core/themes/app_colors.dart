import 'package:flutter/material.dart';

final class AppColors {
  static Color backgroundColor = const Color(0xFF202020);
  static Color primaryColor = const Color(0xFF030124);
  static Color secondaryColor = const Color(0xFFaac8e4);
  static Color grey = const Color(0xFF8e8e8e);
  static Color red = const Color(0xFFfa2542);
  static Color white = const Color(0xFFF2F2F2);
  static Color green = const Color(0xFF75eb86);

  static LinearGradient textGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );
}
