import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider with ChangeNotifier {
  ThemeMode mode = ThemeMode.system;
  Color themeCol = const Color(0xFFF44336);

  void changeMode(bool isDark) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isDark) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    sharedPreferences.setBool('dark', mode == ThemeMode.dark);
    notifyListeners();
  }

  void changeTheme(Color col) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeCol = col;
    sharedPreferences.setInt('themeCol', col.value);
    notifyListeners();
  }

  void getLastData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // ============ dark mode storage ================
    bool isDark = sharedPreferences.getBool('dark') ?? false;
    if (isDark) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    // ============ theme color storage ================

    themeCol = Color(sharedPreferences.getInt('themeCol')?? 0xFFF44336 );

    notifyListeners();
  }
}
