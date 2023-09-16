import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_card.dart';

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
    return const BasicCard(
      padding: EdgeInsets.all(20),
      color: AppTheme.white,
      child: Text('Card'),
    );
  }
}
