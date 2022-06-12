import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';
import '../widgets/home/tuning_card.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: ((prev, next) => next is HomeAllPumpsState),
      builder: (context, state) {
        if (state is HomeAllPumpsState) {
          return CustomScrollView(
            slivers: [
              const BaseAppBar(title: 'Регулировка'),
              SliverWidgetList(
                children: state.pumps.map((e) => TuningCard(pump: e)).toList(),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
