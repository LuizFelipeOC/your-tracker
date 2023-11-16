import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

final class LightTheme {
  static ThemeData get theme => ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: AppColors.blue,
        textTheme: _textTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        textButtonTheme: _textButtonnTheme(),
      );

  static TextButtonThemeData _textButtonnTheme() => TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(AppColors.primary),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          overlayColor: MaterialStatePropertyAll(AppColors.secondary.withOpacity(0.1)),
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primary,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: const MaterialStatePropertyAll(2),
        ),
      );

  static TextTheme _textTheme() => TextTheme(
        headlineLarge: TextStyle(
          fontSize: 26,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontSize: 22,
          color: AppColors.secondary,
          fontWeight: FontWeight.w500,
        ),
      );
}
