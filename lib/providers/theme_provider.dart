import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme;
  bool isDarkMode = false;

  void themeToggle() {
    isDarkMode = !isDarkMode;
    currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
