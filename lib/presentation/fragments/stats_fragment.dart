import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/stats/stats_cubit.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/page_header.dart';
import '../widgets/common/sliver_column.dart';
import '../widgets/home/stats_achievements.dart';
import '../widgets/home/stats_cocktail.dart';
import '../widgets/home/stats_counter.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StatsCubit>().updateValues();
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Статистика'),
        BlocBuilder<StatsCubit, StatsState>(
          builder: (context, state) {
            return SliverColumn(
              children: [
                StatsCounter(
                  liters: state is StatsValues ? state.liters : 0,
                ),
                if (state is StatsValues && state.cocktailsCounts.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageHeader(text: 'Любимые коктейли:'),
                      ...state.cocktailsCounts.entries
                          .map((e) => StatsCocktail(
                                name: e.key,
                                count: e.value,
                              ))
                          .toList(),
                    ],
                  ),
                if (state is StatsValues && state.cocktailsDays.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageHeader(text: 'Последний коктейль:'),
                      ...state.cocktailsDays.entries
                          .map((e) => StatsCocktail(
                                name: e.key,
                                daysAgo: e.value,
                              ))
                          .toList(),
                    ],
                  ),
                const StatsAchievements(),
              ],
            );
          },
        ),
      ],
    );
  }
}
