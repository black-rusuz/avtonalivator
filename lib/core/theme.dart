import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const accent = Color(0xFFFAD960);

  static final value = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _createMaterialColor(accent),
    ).copyWith(
      background: const Color(0xFFFFFFFF),
    ),
  );

  static const black = Color.fromRGBO(1, 0, 2, 1);
  static const grey = Color.fromRGBO(130, 130, 130, 1);
  static const greyLight = Color.fromRGBO(196, 196, 196, 1);
  static const greyDivider = Color.fromRGBO(237, 237, 237, 1);
  static const white = Colors.white;

  static const radius = Radius.circular(30);
  static const borderRadius = BorderRadius.all(Radius.circular(30));

  static final pageTitle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final text = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static final textLight = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: greyLight,
  );

  static final additional = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: grey,
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
