import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static const int _yellowPrimaryValue = 0xFFFAD960;
  static const MaterialColor yellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
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
    },
  );

  static const int _yellowAccentValue = 0xFFFFFFFF;
  static const MaterialColor yellowAccent = MaterialColor(
    _yellowAccentValue,
    <int, Color>{
      100: Color(0xFFFFFFFF),
      200: Color(_yellowAccentValue),
      400: Color(0xFFFFF3D5),
      700: Color(0xFFFFEBBC),
    },
  );

  static const Color black = Color.fromRGBO(1, 0, 2, 1);
  static const Color grey = Color.fromRGBO(130, 130, 130, 1);
  static const Color greyLight = Color.fromRGBO(196, 196, 196, 1);
  static const Color greyDivider = Color.fromRGBO(237, 237, 237, 1);

  static TextStyle launchHeader = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static TextStyle launchSubheader = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle pageTitle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle text = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static TextStyle textLight = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: greyLight,
  );

  static TextStyle additional = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: grey,
  );

  static List<BoxShadow> cardShadows = const [
    BoxShadow(
      blurRadius: 2,
      offset: Offset(0, 0.2),
      color: Color.fromRGBO(0, 0, 0, 0.02),
    ),
    BoxShadow(
      blurRadius: 7,
      offset: Offset(0, 0.5),
      color: Color.fromRGBO(0, 0, 0, 0.04),
    ),
    BoxShadow(
      blurRadius: 30,
      offset: Offset(0, 2),
      color: Color.fromRGBO(0, 0, 0, 0.06),
    ),
  ];
}
