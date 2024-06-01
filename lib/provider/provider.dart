import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  changeMode(bool isDark) {
    if (isDark) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    notifyListeners();
  }
}
