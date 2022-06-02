import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../model/pump_model.dart';
import '../common/base_card.dart';
import 'tuning_card_inner.dart';

class TuningCard extends StatelessWidget {
  final PumpModel pump;

  const TuningCard({Key? key, required this.pump}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: ((prev, next) =>
          next is HomePumpDefinedState && next.pump.id == pump.id),
      builder: (context, state) =>
          state is HomePumpDefinedState && state.pump.id == pump.id
              ? BaseCard(
                  height: 85,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  isActive: state.pump.isEnabled,
                  duration: 200,
                  child: TuningCardInner(pump: state.pump),
                )
              : BaseCard(
                  height: 85,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  isActive: pump.isEnabled,
                  duration: 200,
                  child: TuningCardInner(pump: pump),
                ),
    );
  }
}
