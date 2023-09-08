import 'package:daily_buzz/theme/theme_preferences.dart';
import 'package:flutter/material.dart';

class ModelTheme extends ChangeNotifier {
  late bool _isDarkTheme;
  late ThemePreferences _preferences;
  bool get isDarkTheme => _isDarkTheme;

  ModelTheme() {
    _isDarkTheme = false;
    _preferences = ThemePreferences();
    getThemePreferences();
  }
  
  //Switching the themes
  set isDark(bool value) {
    _isDarkTheme = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getThemePreferences() async {
    _isDarkTheme = await _preferences.getTheme();
    notifyListeners();
  }
}
