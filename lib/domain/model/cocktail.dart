import 'package:equatable/equatable.dart';

import '../../data/model/cocktail.dart';
import '../equals.dart';
import 'drink.dart';
import 'pump.dart';

class UiCocktail extends Equatable {
  final int id;
  final String name;
  final String image;
  final List<UiDrink> drinks;
  final String description;
  final String recipe;

  const UiCocktail({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.recipe,
    required this.drinks,
  });

  factory UiCocktail.fromApi(ApiCocktail cocktail) {
    return UiCocktail(
      id: cocktail.id,
      name: cocktail.name,
      image: cocktail.imageUrl,
      description: cocktail.description,
      recipe: cocktail.recipe,
      drinks: cocktail.drinks.map(UiDrink.fromApi).toList(),
    );
  }

  List<String> get ingredients => drinks.map((e) => e.name).toList();

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
        [...drinks],
      ];
}
