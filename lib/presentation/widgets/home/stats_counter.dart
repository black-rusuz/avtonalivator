import 'dart:math';

import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsCounter extends StatelessWidget {
  const StatsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '370',
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'литров выпито',
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
                child: const CircularProgressIndicator(
                  value: 0.65,
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
