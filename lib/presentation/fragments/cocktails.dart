import 'package:flutter/cupertino.dart';

import '../../domain/model/cocktail.dart';
import '../widgets/cocktail_card.dart';

class CocktailsFragment extends StatelessWidget {
  const CocktailsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      itemCount: 8,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    const item = UiCocktail(id: 0, name: 'name', image: 'image', drinks: []);
    return CocktailCard(
      cocktail: item,
      onItemTap: (v) {},
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
