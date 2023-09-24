import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../../domain/model/drink.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';

const _horizontal = AppTheme.horizontalPadding;

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
            const SizedBox(height: 30),
            Padding(
              padding: _horizontal * 2,
              child: Text(
                cocktail.name,
                style: AppTheme.pageTitle.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: _horizontal,
              child: Column(
                children: cocktail.drinks.map(drinkMapper).toList(),
              ),
            ),
            const SizedBox(height: 15),
            if (cocktail.description.isNotEmpty)
              Padding(
                padding: _horizontal * 2,
                child: Text(cocktail.description),
              ),
            const SizedBox(height: 120),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.water_drop),
            label: const Text(Strings.goPour),
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
      padding: AppTheme.padding,
      margin: EdgeInsets.only(bottom: gap),
      child: Row(
        children: [
          const Icon(
            Icons.local_drink_rounded,
            size: 36,
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
