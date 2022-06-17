import 'package:flutter/material.dart';

import '../../style.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';
import '../widgets/home/stats_cocktail.dart';
import '../widgets/home/stats_counter.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Статистика'),
        SliverWidgetList(
          children: [
            const StatsCounter(liters: 372),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Любимые коктейли:', style: Style.pageTitle),
            ),
            const StatsCocktail(name: 'Пьяная Мэри', count: 42),
            const StatsCocktail(name: 'Б51', count: 34),
            const StatsCocktail(name: 'Русская рулетка', count: 17),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Последний коктейль:', style: Style.pageTitle),
            ),
            const StatsCocktail(name: 'Русская рулетка', daysAgo: 2),
          ],
        ),
      ],
    );
  }
}
