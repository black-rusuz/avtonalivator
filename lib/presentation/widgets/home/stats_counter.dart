import 'dart:math';

import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsCounter extends StatelessWidget {
  final int liters;

  const StatsCounter({Key? key, required this.liters}) : super(key: key);

  String get litersWord {
    switch (liters % 100) {
      case 11:
      case 12:
      case 13:
      case 14:
        return ' литров выпито';
    }
    switch (liters % 10) {
      case 0:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return ' литров выпито';
      case 1:
        return ' литр выпит';
      case 2:
      case 3:
      case 4:
        return ' литра выпито';
    }
    return ' литров выпито';
  }

  double get value =>
      int.parse(liters.toString() + '0').toDouble() /
      int.parse('1' + '0' * (liters.toString().length + 1));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              width: 260,
              height: 260,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      liters.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      litersWord,
                      style: Style.cardHeader
                          .copyWith(color: Style.switchDisabled),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 260,
              height: 260,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
