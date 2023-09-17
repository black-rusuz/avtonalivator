import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';

class CocktailCard extends StatelessWidget {
  final UiCocktail cocktail;
  final ValueChanged<UiCocktail> onItemTap;

  const CocktailCard({
    super.key,
    required this.cocktail,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      onTap: () => onItemTap(cocktail),
      color: AppTheme.background,
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(50),
      child: Row(
        children: [
          ClipOval(
            child: BasicImage(
              cocktail.image,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(cocktail.name),
          ),
        ],
      ),
    );
  }
}
