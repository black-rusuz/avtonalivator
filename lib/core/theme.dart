import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static const radius = Radius.circular(20);
  static const borderRadius = BorderRadius.all(Radius.circular(20));
  static const border = OutlineInputBorder(borderRadius: borderRadius);

  static final value = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorSchemeSeed: accent,
    scaffoldBackgroundColor: background,
    textTheme: GoogleFonts.rubikTextTheme(),
    appBarTheme: const AppBarTheme(backgroundColor: background),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color.lerp(AppTheme.accent, AppTheme.black, 0.1),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 5,
      overlayShape: SliderComponentShape.noOverlay,
      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.transparent,
      thumbShape: const RoundSliderThumbShape(
        elevation: 0,
        pressedElevation: 0,
        enabledThumbRadius: 5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppTheme.background,
      border: border,
      enabledBorder: border.copyWith(
        borderSide: const BorderSide(color: AppTheme.greyLight),
      ),
      hintStyle: textLight.copyWith(color: grey),
      labelStyle: textLight.copyWith(color: grey),
      helperStyle: textLight.copyWith(color: grey),
      contentPadding: const EdgeInsets.symmetric(
        vertical: paddingValue / 3,
        horizontal: paddingValue,
      ),
    ),
  );

  static final pageTitle = GoogleFonts.raleway(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const text = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: black,
  );

  static const textLight = TextStyle(
    fontSize: 14,
    color: greyLight,
  );

  static const additional = TextStyle(
    fontSize: 10,
    color: grey,
  );
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
