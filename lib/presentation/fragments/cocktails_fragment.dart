import 'package:flutter/material.dart';

import '../widgets/cocktail/cocktails_filter.dart';
import '../widgets/cocktail/cocktails_list.dart';
import '../widgets/cocktail/cocktails_search.dart';
import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_column.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BaseAppBar(title: 'Коктейли'),
        SliverColumn(
          children: [
            CocktailSearch(),
            CocktailsFilter(),
            CocktailsList(),
          ],
        ),
      ],
    );
  }
}
