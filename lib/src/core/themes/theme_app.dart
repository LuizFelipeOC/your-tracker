import 'package:flutter/material.dart';

import 'app_colors.dart';

final class ThemeApp {
  static ThemeData get theme => ThemeData(
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: AppColors.white,
        textTheme: _textTheme(),
        textButtonTheme: _textButtonTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        iconTheme: IconThemeData(color: AppColors.grey),
        inputDecorationTheme: _inputTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
        ),
        splashColor: AppColors.primaryColor,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
      );

  static InputDecorationTheme _inputTheme() => InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.2),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 0,
            color: AppColors.grey.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: 0,
            color: AppColors.grey.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
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
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
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
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
          overlayColor: MaterialStatePropertyAll(
            AppColors.secondaryColor,
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
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: AppColors.grey,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: AppColors.grey,
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          color: AppColors.grey,
          fontSize: 16,
          letterSpacing: 1,
        ),
        labelLarge: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );
}
