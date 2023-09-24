import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../../widgets/basic_card.dart';
import '../../widgets/percent_indicator.dart';

class PourModal extends StatelessWidget {
  const PourModal({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConnectionProvider>();
    final value = provider.percent / 100;
    final drink = provider.drink;

    // TODO: read mode
    // final finish = mode == DeviceMode.wait;
    final finish = value >= 1 && drink == null;
    if (finish) Navigator.of(context).pop();

    return BasicCard(
      child: ListView(
        padding: AppTheme.listPadding,
        controller: PrimaryScrollController.of(context),
        children: [
          Text(
            drink ?? Strings.loading,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppTheme.black,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          Padding(
            padding: AppTheme.padding * 4,
            child: PercentIndicator(
              percent: min(value, 1),
              animation: false,
            ),
          ),
          LinearProgressIndicator(
            value: min(value, 1),
          ),
        ],
      ),
    );
  }
}
