import 'package:flutter/material.dart';

class AppTheme {
  static const accent = Color(0xFFFAD960);

  static final value = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _createMaterialColor(accent),
    ).copyWith(
      background: const Color(0xFFFFFFFF),
    ),
  );
}

MaterialColor _createMaterialColor(Color color) {
  final shadeValues = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  final shadeEntries = shadeValues.map((e) => _getShade(e, color));
  final shades = Map.fromEntries(shadeEntries);
  return MaterialColor(color.value, shades);
}

MapEntry<int, Color> _getShade(int value, Color color) {
  final shade = color.withOpacity(value / 1000);
  return MapEntry(value, shade);
}
