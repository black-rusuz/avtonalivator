import 'package:flutter/material.dart';

import '../../../model/cocktail_model.dart';

class CocktailListItem extends StatelessWidget {
  final CocktailModel cocktail;

  const CocktailListItem({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      title: Text(cocktail.name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(cocktail.imageUrl ?? ''),
      ),
    );
  }
}
