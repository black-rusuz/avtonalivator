import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme.dart';
import '../../../domain/model/device_data.dart';
import '../../provider/connection.dart';
import '../../strings.dart';
import '../../widgets/percent_indicator.dart';

class PourModal extends StatelessWidget {
  const PourModal({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConnectionProvider>();
    final data = provider.data;
    final drink = provider.drink;
    final value = data.percent / 100;

    final finish = data.mode == DeviceMode.wait && data.step == 0;
    if (finish) Navigator.of(context).pop();

    return _ModalData(drink: drink, value: value);
  }
}

class _ModalData extends StatelessWidget {
  final String? drink;
  final double value;

  const _ModalData({
    required this.drink,
    required this.value,
  });

  int get _percent => (value * 100).round();

  String get percent => '$_percent%';

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
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
            child: Text(
              percent,
              style: GoogleFonts.inter(
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
