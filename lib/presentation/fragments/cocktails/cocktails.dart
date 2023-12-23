import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme.dart';
import '../../../domain/model/cocktail.dart';
import '../../../domain/model/drink.dart';
import '../../strings.dart';
import '../../widgets/search_field.dart';
import '../../widgets/sliver_scaffold.dart';
import '../tuning/provider.dart';
import 'provider.dart';
import 'widgets/background.dart';
import 'widgets/cocktail_card.dart';
import 'widgets/detail.dart';
import 'widgets/filter_card.dart';

export 'provider.dart';

part 'widgets/app_bar.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktails = context.watch<CocktailsProvider>().cocktails;
    return _CocktailsList(cocktails: cocktails);
  }
}

class _CocktailsList extends StatelessWidget {
  final List<UiCocktail> cocktails;

  const _CocktailsList({required this.cocktails});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CocktailsProvider>();
    final tuning = context.watch<TuningProvider>();
    final drinks = tuning.drinks.names;

    return SliverScaffold(
      sliverAppBar: _CocktailsAppBar(
        search: provider.searchCocktail,
        background: CocktailsBackground(cocktails: provider.cocktails),
      ),
      body: FilterCard(
        isActive: provider.useFilter,
        onChanged: (v) => provider.setFilter(drinks, v),
      ),
      bodyBuilder: (_, controller) {
        return ListView.separated(
          shrinkWrap: true,
          controller: controller,
          padding: AppTheme.listPadding,
          itemCount: cocktails.length,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
        );
      },
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = cocktails[index];
    return CocktailCard(
      cocktail: item,
      onItemTap: (cocktail) => showDetail(context, cocktail),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
