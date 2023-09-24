import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme.dart';
import '../../../strings.dart';
import '../../../widgets/percent_indicator.dart';

class StatsCounter extends StatelessWidget {
  final double liters;

  const StatsCounter({super.key, required this.liters});

  String get litersWord {
    if (liters < 1) return Strings.fewLiters;
    switch (liters.floor() % 100) {
      case 11:
      case 12:
      case 13:
      case 14:
        return Strings.manyLiters;
    }
    switch (liters.floor() % 10) {
      case 0:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return Strings.manyLiters;
      case 1:
        return Strings.oneLiter;
      case 2:
      case 3:
      case 4:
        return Strings.fewLiters;
    }
    return Strings.manyLiters;
  }

  double get percent {
    if (liters < 1) return liters;
    switch (liters.floor().toString().length) {
      case 1:
        return liters < 5 ? liters / 5 : liters / 10;
      case 2:
        return liters < 50 ? liters / 50 : liters / 100;
      case 3:
        return liters < 500 ? liters / 500 : liters / 1000;
      case 4:
        return liters < 5000 ? liters / 5000 : liters / 10000;
    }

    final value = liters * 10;
    final zeros = '0' * liters.toString().length;
    final max = int.parse('1$zeros');
    return value / max;
  }

  @override
  Widget build(BuildContext context) {
    return PercentIndicator(
      percent: percent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            liters < 10
                ? liters.toStringAsFixed(2)
                : liters < 100
                    ? liters.toStringAsFixed(1)
                    : liters.floor().toString(),
            style: GoogleFonts.inter(
              fontSize: 64,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            litersWord,
            style: AppTheme.textLight,
          ),
        ],
      ),
    );
  }
}
