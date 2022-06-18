import 'dart:math';

import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsCounter extends StatelessWidget {
  final double liters;

  const StatsCounter({Key? key, required this.liters}) : super(key: key);

  String get litersWord {
    if (liters < 1) return 'литра выпито';
    switch (liters.floor() % 100) {
      case 11:
      case 12:
      case 13:
      case 14:
        return 'литров выпито';
    }
    switch (liters.floor() % 10) {
      case 0:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
        return 'литров выпито';
      case 1:
        return 'литр выпит';
      case 2:
      case 3:
      case 4:
        return 'литра выпито';
    }
    return 'литров выпито';
  }

  double get value {
    if (liters < 1) return liters;
    int _liters = liters.floor();
    switch (_liters.toString().length) {
      case 1:
        return liters < 5 ? liters / 5 : liters / 10;
      case 2:
        return liters < 50 ? liters / 50 : liters / 100;
      case 3:
        return liters < 500 ? liters / 500 : liters / 1000;
      case 4:
        return liters < 5000 ? liters / 5000 : liters / 10000;
    }
    return int.parse(liters.toString() + '0').toDouble() /
        int.parse('1' + '0' * (liters.toString().length + 1));
  }

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
                      style: Style.textLight,
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
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: value),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutSine,
                  builder: (_, value, __) => CircularProgressIndicator(
                    value: value,
                    strokeWidth: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
