import 'package:flutter/material.dart';

import '../../../model/cocktail_model.dart';
import '../common/base_divider.dart';
import 'cocktail_detail.dart';

class CocktailListItem extends StatelessWidget {
  final CocktailModel cocktail;

  const CocktailListItem({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  void showCocktailModal(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        builder: (context) => FractionallySizedBox(
          heightFactor: 0.8,
          child: CocktailDetail(cocktail: cocktail),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaseDivider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 20,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(cocktail.imageUrl ?? ''),
          ),
          title: Text(cocktail.name),
          onTap: () => showCocktailModal(context),
        ),
        const BaseDivider(),
      ],
    );
  }
}
