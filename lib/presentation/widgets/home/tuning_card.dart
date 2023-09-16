import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/cubit/tuning/tuning_cubit.dart';
import '../../../model/pump_model.dart';
import '../common/base_card.dart';
import 'tuning_card_inner.dart';

class TuningCard extends StatelessWidget {
  final PumpModel pump;

  const TuningCard({super.key, required this.pump});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TuningCubit, TuningState>(
      buildWhen: (_, next) => next is TuningPump && next.pump.id == pump.id,
      builder: (context, state) {
        if (state is TuningPump && state.pump.id == pump.id) {
          return BaseCard(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            isActive: state.pump.isEnabled,
            child: TuningCardInner(pump: state.pump),
          );
        }
        return BaseCard(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          isActive: pump.isEnabled,
          child: TuningCardInner(pump: pump),
        );
      },
    );
  }
}
