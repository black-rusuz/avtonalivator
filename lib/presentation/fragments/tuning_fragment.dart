import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/tuning/tuning_cubit.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';
import '../widgets/tuning/tuning_card.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Регулировка'),
        SliverWidgetList(
          children: context
              .watch<TuningCubit>()
              .allPumps
              .map((e) => TuningCard(pump: e))
              .toList(),
        ),
      ],
    );
  }
}
