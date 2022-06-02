import 'package:flutter/material.dart';

import '../../../model/cocktail_model.dart';
import '../common/base_divider.dart';

class CocktailListItem extends StatelessWidget {
  final CocktailModel cocktail;

  const CocktailListItem({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const BaseDivider(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 2),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cocktail.imageUrl ?? ''),
            ),
            title: Text(cocktail.name),
          ),
          const BaseDivider(),
        ],
      ),
    );
  }
}
