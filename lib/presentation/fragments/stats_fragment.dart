import 'package:flutter/material.dart';

import '../../style.dart';
import '../widgets/cocktail/cocktail_drink.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';
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
            const StatsCounter(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Любимые коктейли:', style: Style.pageTitle),
            ),
            const CocktailDrink(name: 'Пьяная Мэри', volume: 40),
          ],
        ),
      ],
    );
  }
}
