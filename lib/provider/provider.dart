import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  Color themeCol = Colors.red;

  void changeMode(bool isDark) {
    if (isDark) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    notifyListeners();
  }

  void changeTheme(Color col) {
    themeCol = col;
    notifyListeners();
  }
}
