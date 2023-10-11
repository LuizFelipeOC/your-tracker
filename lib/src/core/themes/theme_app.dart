import 'package:flutter/material.dart';

import 'app_colors.dart';

final class ThemeApp {
  static ThemeData get theme => ThemeData(
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: _textTheme(),
        textButtonTheme: _textButtonTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        splashColor: AppColors.primaryColor,
        brightness: Brightness.light,
      );

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColors.primaryColor,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll<Color>(
            AppColors.primaryColor,
          ),
          overlayColor: MaterialStatePropertyAll(
            AppColors.grey,
          ),
        ),
      );

  static TextTheme _textTheme() => TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 4.70,
        ),
        headlineMedium: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          letterSpacing: 2,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          letterSpacing: 4.75,
        ),
        bodySmall: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          letterSpacing: 4.75,
        ),
      );
}
