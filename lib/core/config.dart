import 'package:flutter/material.dart';

import '../data/model/config.dart';

const _defaultColor = Color(0xFFFAD960);

class AppConfig {
  final Color accentColor;
  final int drinksQuantity;

  AppConfig({
    this.accentColor = _defaultColor,
    this.drinksQuantity = 6,
  });

  factory AppConfig.fromApi(ApiConfig config) {
    return AppConfig(
      accentColor: _tryParseColor(config.accentColor) ?? _defaultColor,
      drinksQuantity: config.drinksQuantity ?? 6,
    );
  }
}

Color? _tryParseColor(String? hex) {
  if (hex == null) return null;
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) {
    hex = '${hex}FF';
  }

  if (hex.length == 8) {
    final chars = hex.split('');
    chars.insert(0, chars.removeLast());
    chars.insert(0, chars.removeLast());
    hex = chars.join();
    return Color(int.parse('0x$hex'));
  }
  return null;
}
