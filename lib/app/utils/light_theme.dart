import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightTheme {
  static ThemeData get themeData => ThemeData(
        fontFamily: 'Ubuntu',
        textTheme: _textThemeData(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        textButtonTheme: _textButtonThemeData(),
        iconTheme: _iconThemeData(),
      );

  static IconThemeData _iconThemeData() {
    return IconThemeData(
      size: 45,
      color: AppColors.primary,
    );
  }

  static TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll<Color>(AppColors.primary.withOpacity(0.2)),
        foregroundColor: WidgetStatePropertyAll<Color>(AppColors.primary),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll<Color>(AppColors.white.withOpacity(0.1)),
        backgroundColor: WidgetStatePropertyAll<Color>(AppColors.primary),
        foregroundColor: WidgetStatePropertyAll<Color>(AppColors.white),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  static TextTheme _textThemeData() {
    return TextTheme(
      headlineMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 26, color: AppColors.primary),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.primary),
      bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.primary),
    );
  }
}
