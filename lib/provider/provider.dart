import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  Color themeCol = Colors.red;

  void changeMode(bool isDark) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isDark) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    sharedPreferences.setBool('dark', mode == ThemeMode.dark);
    print(sharedPreferences.getBool('dark'));
    notifyListeners();
  }

  void changeTheme(Color col) {
    themeCol = col;
    notifyListeners();
  }

  void getLastData() async {
  
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getBool('dark'));

    bool isDark = sharedPreferences.getBool('dark') ?? false;
    if (isDark) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    notifyListeners();
  }
}
