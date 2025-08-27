import 'package:flutter/material.dart';

class ThemeModeViewModel extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light;
  void toggleTheme(){
    if (mode == ThemeMode.light) {
      mode = ThemeMode.dark;
    }  else{
      mode = ThemeMode.light;
    }
    notifyListeners();
  }
}