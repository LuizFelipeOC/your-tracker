import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightTheme {
  static ThemeData get themeData => ThemeData(
        fontFamily: 'Ubuntu',
        textTheme: _textThemeData(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        textButtonTheme: _textButtonThemeData(),
        iconTheme: _iconThemeData(),
        inputDecorationTheme: _inputDecorationTheme(),
        floatingActionButtonTheme: _floatingActionButtonThemeData(),
      );

  static FloatingActionButtonThemeData _floatingActionButtonThemeData() {
    return FloatingActionButtonThemeData(
      foregroundColor: AppColors.white,
      extendedTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: AppColors.primary.withOpacity(0.2),
      backgroundColor: AppColors.primary,
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primary.withOpacity(0.04),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primary.withOpacity(0.4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primary.withOpacity(0.8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red.shade300,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.red.shade300,
        ),
      ),
      errorStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

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
      bodySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.primary),
    );
  }
}
