import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/tuning/tuning_cubit.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_column.dart';
import '../widgets/home/tuning_card.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Регулировка'),
        SliverColumn(
          children: context
              .read<TuningCubit>()
              .allPumps
              .map((e) => TuningCard(pump: e))
              .toList(),
        ),
      ],
    );
  }
}
