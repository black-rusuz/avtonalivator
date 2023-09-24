import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../provider/connection.dart';
import '../../widgets/basic_card.dart';
import '../../widgets/percent_indicator.dart';

class PourModal extends StatelessWidget {
  const PourModal({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConnectionProvider>();
    final value = provider.percent / 100;
    final drink = provider.drink;

    return BasicCard(
      child: Center(),
    );
  }
}
