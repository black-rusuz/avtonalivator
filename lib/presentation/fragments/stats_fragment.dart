import 'package:flutter/material.dart';

import '../widgets/common/base_app_bar.dart';
import '../widgets/common/page_header.dart';
import '../widgets/common/sliver_column.dart';
import '../widgets/home/stats_cocktail.dart';
import '../widgets/home/stats_counter.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BaseAppBar(title: 'Статистика'),
        SliverColumn(
          children: [
            StatsCounter(liters: 372),
            PageHeader(text: 'Любимые коктейли:'),
            StatsCocktail(name: 'Пьяная Мэри', count: 42),
            StatsCocktail(name: 'Б51', count: 34),
            StatsCocktail(name: 'Русская рулетка', count: 17),
            PageHeader(text: 'Последний коктейль:'),
            StatsCocktail(name: 'Русская рулетка', daysAgo: 2),
          ],
        ),
      ],
    );
  }
}
