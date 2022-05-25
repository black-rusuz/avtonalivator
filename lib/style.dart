import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static const Color grey = Color(0xFF828282);

  static const int _yellowPrimaryValue = 0xFFFAD960;
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

  static const int _yellowAccentValue = 0xFFFFFFFF;
  static const MaterialColor yellowAccent =
      MaterialColor(_yellowAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_yellowAccentValue),
    400: Color(0xFFFFF3D5),
    700: Color(0xFFFFEBBC),
  });

  static TextStyle get pageTitle => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get cardHeader => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get cardText => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: grey,
      );

  static List<BoxShadow> get cardShadow => const [
        BoxShadow(
          blurRadius: 2,
          offset: Offset(0, 0.1),
          color: Color(0x05000000),
        ),
        BoxShadow(
          blurRadius: 7,
          offset: Offset(0, 0.5),
          color: Color(0x0A000000),
        ),
        BoxShadow(
          blurRadius: 31,
          offset: Offset(0, 0.2),
          color: Color(0x0D000000),
        ),
      ];
}
