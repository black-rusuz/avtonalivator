import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor yellow =
      MaterialColor(_yellowPrimaryValue, <int, Color>{
    50: Color(0xFFFEFAEC),
    100: Color(0xFFFEF4CF),
    200: Color(0xFFFDECB0),
    300: Color(0xFFFCE490),
    400: Color(0xFFFBDF78),
    500: Color(_yellowPrimaryValue),
    600: Color(0xFFF9D558),
    700: Color(0xFFF9CF4E),
    800: Color(0xFFF8CA44),
    900: Color(0xFFF6C033),
  });
  static const int _yellowPrimaryValue = 0xFFFAD960;

  static const MaterialColor yellowAccent =
      MaterialColor(_yellowAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_yellowAccentValue),
    400: Color(0xFFFFF3D5),
    700: Color(0xFFFFEBBC),
  });
  static const int _yellowAccentValue = 0xFFFFFFFF;
}
