import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/stats/stats_cubit.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/base_card.dart';
import '../widgets/common/page_header.dart';
import '../widgets/common/sliver_column.dart';
import '../widgets/home/stats_cocktail.dart';
import '../widgets/home/stats_counter.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Статистика'),
        BlocBuilder<StatsCubit, StatsState>(builder: (context, state) {
          return SliverColumn(
            children: [
              StatsCounter(
                liters: state is StatsValues ? state.liters.floor() : 0,
              ),
              if (state is StatsValues)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageHeader(text: 'Любимые коктейли:'),
                    ...state.cocktailsCounts.entries
                        .map((e) => StatsCocktail(
                              name: e.key.name,
                              count: e.value,
                            ))
                        .toList(),
                  ],
                ),
              if (state is StatsValues)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageHeader(text: 'Последний коктейль:'),
                    ...state.cocktailsDays.entries
                        .map((e) => StatsCocktail(
                              name: e.key.name,
                              daysAgo: e.value,
                            ))
                        .toList(),
                  ],
                ),
              BaseCard(
                padding: const EdgeInsets.symmetric(vertical: 25),
                margin: const EdgeInsets.all(20),
                child: Text(
                  'Достижения',
                  textAlign: TextAlign.center,
                  style: Style.text,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
