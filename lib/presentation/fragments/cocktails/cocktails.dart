import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme.dart';
import '../../../domain/model/cocktail.dart';
import '../../strings.dart';
import '../../widgets/search_field.dart';
import '../../widgets/sliver_scaffold.dart';
import '../tuning/provider.dart';
import 'provider.dart';
import 'widgets/background.dart';
import 'widgets/cocktail_list.dart';
import 'widgets/filter_card.dart';

export 'provider.dart';

part 'widgets/app_bar.dart';

class CocktailsFragment extends StatefulWidget {
  const CocktailsFragment({super.key});

  @override
  State<CocktailsFragment> createState() => _State();
}

class _State extends State<CocktailsFragment> with TickerProviderStateMixin {
  late TabController controller;
  List<UiCocktail> cocktails = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      final provider = context.read<CocktailsProvider>();
      setState(() {
        cocktails = getCocktails(provider);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CocktailsProvider>();
    final tuning = context.watch<TuningProvider>();

    cocktails = getCocktails(provider);
    final drinks = tuning.cocktail.drinkNames;

    return SliverScaffold(
      sliverAppBar: _CocktailsAppBar(
        search: provider.searchCocktail,
        background: CocktailsBackground(cocktails: cocktails),
        controller: controller,
      ),
      body: FilterCard(
        isActive: provider.useFilter,
        onChanged: (v) => provider.setFilter(v, drinks),
      ),
      bodyBuilder: (_, controller) {
        return CocktailsList(
          cocktails: cocktails,
          controller: controller,
        );
      },
    );
  }

  List<UiCocktail> getCocktails(CocktailsProvider provider) {
    switch (controller.index) {
      case 0:
        return provider.cocktails;
      case 1:
        return provider.favCocktails;
      case 2:
        return provider.userCocktails;
    }
    return [];
  }
}
