import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/router.dart';
import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../../domain/model/pump.dart';
import '../../../strings.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_image.dart';
import '../../tuning/provider.dart';

const _horizontal = AppTheme.horizontalPadding;

void setCocktail(BuildContext context, UiCocktail cocktail) {
  final tuning = context.read<TuningProvider>();
  tuning.setCocktail(cocktail);

  Navigator.of(context).pop();
  AppRoutes.setHomeIndex(0);
}

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
        initialChildSize: 0.8,
        builder: (_, controller) {
          return CocktailDetail(
            cocktail: cocktail,
            setCocktail: () => setCocktail(context, cocktail),
            controller: controller,
          );
        },
      );
    },
  );
}

class CocktailDetail extends StatelessWidget {
  final UiCocktail cocktail;
  final VoidCallback? setCocktail;
  final ScrollController? controller;

  const CocktailDetail({
    super.key,
    required this.cocktail,
    this.setCocktail,
    this.controller,
  });

  Widget drinkMapper(UiPump drink) {
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
              padding: _horizontal.copyWith(top: 30, bottom: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: _horizontal,
                    child: Text(
                      cocktail.name,
                      style: AppTheme.pageTitle.copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (cocktail.recipe.isNotEmpty)
                    Padding(
                      padding: _horizontal,
                      child: Text(cocktail.recipe),
                    ),
                  const SizedBox(height: 15),
                  ...cocktail.pumps.map(drinkMapper),
                  const SizedBox(height: 15),
                  if (cocktail.description.isNotEmpty)
                    Padding(
                      padding: _horizontal,
                      child: Text(cocktail.description),
                    ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton.extended(
            onPressed: setCocktail,
            icon: const Icon(Icons.water_drop),
            label: const Text(Strings.goPour),
          ),
        ),
      ],
    );
  }
}

class _DrinkCard extends StatelessWidget {
  final UiPump drink;
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
