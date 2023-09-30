import 'package:flutter/material.dart';

class AppTheme {
  static const _accent = Color(0xFFFAD960);
  static final accent = _createMaterialColor(_accent);
  static const error = Colors.redAccent;

  static const black = Color(0xFF010002);
  static const grey = Color(0xFF828282);
  static const greyLight = Color(0xFFC4C4C4);
  static const divider = Color(0xFFEDEDED);
  static const background = Colors.white;

  static const double paddingValue = 15;
  static const padding = EdgeInsets.all(paddingValue);
  static const horizontalPadding =
      EdgeInsets.symmetric(horizontal: paddingValue);
  static const listPadding = EdgeInsets.symmetric(
      vertical: paddingValue * 2, horizontal: paddingValue);

  static const radius = Radius.circular(0);
  static const borderRadius = BorderRadius.all(Radius.circular(0));
  static const border = OutlineInputBorder(borderRadius: borderRadius);
  static const duration = Duration(milliseconds: 200);

  static final value = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorSchemeSeed: accent,
  );

  static const pageTitle = TextStyle();

  static const text = TextStyle();

  static const textLight = TextStyle();

  static const additional = TextStyle();
}

MaterialColor _createMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: color.withOpacity(0.05),
    100: color.withOpacity(0.1),
    200: color.withOpacity(0.2),
    300: color.withOpacity(0.3),
    400: color.withOpacity(0.4),
    500: color.withOpacity(0.5),
    600: color.withOpacity(0.6),
    700: color.withOpacity(0.7),
    800: color.withOpacity(0.8),
    900: color.withOpacity(0.9),
  });
}
