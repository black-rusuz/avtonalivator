import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme.dart';
import '../../../domain/model/cocktail.dart';
import '../../strings.dart';
import '../../widgets/search_field.dart';
import 'provider.dart';
import 'widgets/cocktail_card.dart';

export 'provider.dart';

part 'widgets/app_bar.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final cocktails = context.watch<CocktailsProvider>().cocktails;
    return _CocktailsList(
      cocktails: [
        ...cocktails,
        ...cocktails,
        ...cocktails,
        ...cocktails,
        ...cocktails,
      ],
    );
  }
}

class _CocktailsList extends StatelessWidget {
  final List<UiCocktail> cocktails;

  const _CocktailsList({required this.cocktails});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CocktailsProvider>();

    return CustomScrollView(
      slivers: [
        _CocktailsAppBar(
          search: provider.searchCocktail,
        ),
        SliverToBoxAdapter(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            itemCount: cocktails.length,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
          ),
        ),
      ],
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
    return SizedBox(height: index == 0 ? 20 : 10);
  }
}
