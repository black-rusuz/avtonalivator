import 'package:flutter/cupertino.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';

class CocktailDetail extends StatelessWidget {
  final UiCocktail cocktail;

  const CocktailDetail({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      child: ListView(
        controller: PrimaryScrollController.of(context),
        children: [
          BasicImage(
            cocktail.image,
            borderRadius: const BorderRadius.vertical(top: AppTheme.radius),
          ),
          Text(cocktail.name),
          ...cocktail.drinks.map((e) => Text(e.toString())),
        ],
      ),
    );
  }
}
