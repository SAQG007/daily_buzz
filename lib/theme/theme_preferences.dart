import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const isDailyBuzzDarkTheme = "isDailyBuzzDarkTheme";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isDailyBuzzDarkTheme, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(isDailyBuzzDarkTheme) ?? false;
  }
}
