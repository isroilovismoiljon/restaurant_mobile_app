import 'package:flutter/material.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';

class AppThemes{
  static ThemeMode mode = ThemeMode.dark;
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.redPinkFD5D69,
      onPrimary: AppColors.whiteBeigeFFFDF9,
      secondary: AppColors.pinkFFC6C9,
      onSecondary: AppColors.pinkColorEC888D,
      error: Colors.amber,
      onError: Colors.red,
      surface: AppColors.whiteBeigeFFFDF9,
      onSurface: AppColors.black,
    ),
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.redPinkFD5D69,
      onPrimary: AppColors.whiteBeigeFFFDF9,
      secondary: AppColors.pinkFFC6C9,
      onSecondary: AppColors.pinkColorEC888D,
      error: Colors.amber,
      onError: Colors.red,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.redPinkFD5D69,
    ),
  );

  void toggleTheme(){
    if (mode == ThemeMode.light) {
      mode = ThemeMode.dark;
    }  else{
      mode = ThemeMode.light;
    }
  }
}