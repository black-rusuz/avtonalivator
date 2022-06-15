import 'package:cached_network_image/cached_network_image.dart';
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
          leading: Center(
            widthFactor: 1,
            child: CachedNetworkImage(
              fadeInCurve: Curves.easeInSine,
              fadeOutCurve: Curves.easeOutSine,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
              imageUrl: cocktail.imageUrl ?? '',
              placeholder: (_, __) => const Icon(Icons.liquor_rounded),
              imageBuilder: (_, image) => CircleAvatar(backgroundImage: image),
            ),
          ),
          title: Text(cocktail.name),
          onTap: () => showCocktailModal(context),
        ),
        const BaseDivider(),
      ],
    );
  }
}
