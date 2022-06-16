import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cocktails/cocktails_cubit.dart';
import '../common/base_card.dart';
import '../common/base_switch.dart';

class CocktailsFilter extends StatelessWidget {
  const CocktailsFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsCubit, CocktailsState>(
      builder: (context, state) {
        return BaseCard(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Готово к наливу', style: Style.cardHeader),
              // TODO:
              BaseSwitch(value: false, onToggle: (v) {}),
            ],
          ),
        );
      },
    );
  }
}
