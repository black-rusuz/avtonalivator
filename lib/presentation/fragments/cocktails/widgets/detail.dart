import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../../domain/model/drink.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';

void showDetail(BuildContext context, UiCocktail cocktail) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: AppTheme.radius),
    ),
    builder: (_) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) {
          return CocktailDetail(
            cocktail: cocktail,
            controller: controller,
          );
        },
      );
    },
  );
}

class CocktailDetail extends StatelessWidget {
  final UiCocktail cocktail;
  final ScrollController? controller;

  const CocktailDetail({
    super.key,
    required this.cocktail,
    this.controller,
  });

  Widget drinkMapper(UiDrink drink) {
    return _DrinkCard(drink: drink, gap: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          controller: controller,
          children: [
            BasicImage(
              cocktail.image,
              borderRadius: const BorderRadius.vertical(top: AppTheme.radius),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
              child: Text(
                cocktail.name,
                style: AppTheme.pageTitle.copyWith(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: cocktail.drinks.map(drinkMapper).toList(),
              ),
            ),
            if (cocktail.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 30),
                child: Text(cocktail.description),
              ),
            const SizedBox(height: 80),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.water_drop),
            label: const Text(Strings.tuning),
          ),
        ),
      ],
    );
  }
}

class _DrinkCard extends StatelessWidget {
  final UiDrink drink;
  final double gap;

  const _DrinkCard({
    required this.drink,
    required this.gap,
  });

  String get volume => drink.volume.toString() + Strings.ml;

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      color: AppTheme.background,
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: gap),
      child: Row(
        children: [
          const Icon(
            Icons.local_drink_rounded,
            size: 48,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(drink.name),
          ),
          const SizedBox(width: 8),
          Text(volume),
        ],
      ),
    );
  }
}
