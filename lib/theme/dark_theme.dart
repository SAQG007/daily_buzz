import 'package:flutter/material.dart';

const fontFamily = "Quicksand Regular";

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fontFamily,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xffD0BCFF),
    onPrimary: Color(0xff381E72),
    primaryContainer: Color(0xff4F378B),
    onPrimaryContainer: Color(0xffEADDFF),
    secondary: Color(0xffCCC2DC),
    onSecondary: Color(0xff332D41),
    secondaryContainer: Color(0xff4A4458),
    onSecondaryContainer: Color(0xffE8DEF8),
    tertiary: Color(0xffEFB8C8),
    onTertiary: Color(0xff492532),
    tertiaryContainer: Color(0xff633B48),
    onTertiaryContainer: Color(0xffFFD8E4),
    error: Color(0xffF2B8B5),
    onError: Color(0xff601410),
    errorContainer: Color(0xff8C1D18),
    onErrorContainer: Color(0xffF9DEDC),
    background: Color(0xff1C1B1F),
    onBackground: Color(0xffE6E1E5),
    surface: Color(0xff1C1B1F),
    onSurface: Color(0xffE6E1E5),
    outline: Color(0xff938F99),
    surfaceVariant: Color(0xff49454F),
    onSurfaceVariant: Color(0xffCAC4D0),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);
