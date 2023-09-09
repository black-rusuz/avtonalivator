import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/cubit/cocktails/cocktails_cubit.dart';
import '../../../domain/cubit/tuning/tuning_cubit.dart';
import '../../../style.dart';
import '../common/base_card.dart';
import '../common/base_switch.dart';

class CocktailsFilter extends StatelessWidget {
  const CocktailsFilter({super.key});

  void setFilter(BuildContext context, bool value) => context
      .read<CocktailsCubit>()
      .setFilter(value, context.read<TuningCubit>().drinksEnabled);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsCubit, CocktailsState>(
      builder: (context, state) {
        return BaseCard(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          isActive: state.filtered,
          onTap: () => setFilter(context, !state.filtered),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Готово к наливу', style: Style.text),
              BaseSwitch(
                value: state.filtered,
                onToggle: (v) => setFilter(context, v),
              ),
            ],
          ),
        );
      },
    );
  }
}
