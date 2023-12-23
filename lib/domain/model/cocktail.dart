import 'package:equatable/equatable.dart';

import '../../data/model/cocktail.dart';
import '../equals.dart';
import 'pump.dart';

class UiCocktail extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final String recipe;
  final List<UiPump> pumps;

  const UiCocktail({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.recipe,
    required this.pumps,
  });

  factory UiCocktail.fromApi(ApiCocktail cocktail) {
    return UiCocktail(
      id: cocktail.id,
      name: cocktail.name,
      image: cocktail.imageUrl,
      description: cocktail.description,
      recipe: cocktail.recipe,
      pumps: cocktail.drinks
          .map((e) => UiPump.fromApi(cocktail.drinks.indexOf(e), e))
          .toList(),
    );
  }

  List<String> get ingredients => pumps.map((e) => e.name).toList();

  /// Каждый ингредиент установлен хотя бы в одной помпе
  bool contains(List<String> drinks) {
    return ingredients.every((ingredient) => drinks.any(ingredient.equals));
  }

  bool isReadyFor(List<UiPump> pumps) {
    final drinks = pumps.drinks;
    return contains(drinks);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
