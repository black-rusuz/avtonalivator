import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/cocktail.dart';
import 'cocktails_provider.dart';
import 'widgets/cocktail_card.dart';

export 'cocktails_provider.dart';

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
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      itemCount: cocktails.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = cocktails[index];
    return CocktailCard(
      cocktail: item,
      onItemTap: (v) {},
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
