import 'package:flutter/material.dart';

import '../../../cubit/connect/connect_cubit.dart';
import '../../../cubit/stats/stats_cubit.dart';
import '../../../cubit/tuning/tuning_cubit.dart';
import '../../../model/cocktail_model.dart';
import '../common/base_app_bar.dart';
import '../common/sliver_column.dart';
import 'cocktail_description.dart';
import 'cocktail_drink.dart';
import 'cocktail_image.dart';

class CocktailDetail extends StatelessWidget {
  final CocktailModel cocktail;
  final TuningCubit tuningCubit;
  final ConnectCubit connectCubit;
  final StatsCubit statsCubit;

  const CocktailDetail({
    Key? key,
    required this.cocktail,
    required this.tuningCubit,
    required this.connectCubit,
    required this.statsCubit,
  }) : super(key: key);

  void onTap(BuildContext context) {
    if (cocktail.contains(tuningCubit.drinks)) {
      for (var tunedPump in tuningCubit.allPumps) {
        connectCubit.sendRefresh(tunedPump.mapCocktail(cocktail));
      }
      connectCubit.sendPour();
    } else {
      // TODO: сообщение
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BaseAppBar(title: cocktail.name),
        SliverColumn(
          children: [
            CocktailImage(
              imageUrl: cocktail.imageUrl,
              onTap: () => onTap(context),
            ),
            if (cocktail.drinkA != null && cocktail.volumeA != null)
              CocktailDrink(name: cocktail.drinkA!, volume: cocktail.volumeA!),
            if (cocktail.drinkB != null && cocktail.volumeB != null)
              CocktailDrink(name: cocktail.drinkB!, volume: cocktail.volumeB!),
            if (cocktail.drinkC != null && cocktail.volumeC != null)
              CocktailDrink(name: cocktail.drinkC!, volume: cocktail.volumeC!),
            if (cocktail.drinkD != null && cocktail.volumeD != null)
              CocktailDrink(name: cocktail.drinkD!, volume: cocktail.volumeD!),
            if (cocktail.drinkE != null && cocktail.volumeE != null)
              CocktailDrink(name: cocktail.drinkE!, volume: cocktail.volumeE!),
            if (cocktail.drinkF != null && cocktail.volumeF != null)
              CocktailDrink(name: cocktail.drinkF!, volume: cocktail.volumeF!),
            if (cocktail.description != null)
              CocktailDescription(text: cocktail.description!),
          ],
        ),
      ],
    );
  }
}
