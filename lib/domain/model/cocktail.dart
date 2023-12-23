import 'package:equatable/equatable.dart';

import '../../data/model/cocktail.dart';
import '../equals.dart';
import 'drink.dart';

class UiCocktail extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final String recipe;
  final List<UiDrink> drinks;

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
      drinks: cocktail.drinks
          .map((e) => UiDrink.fromApi(cocktail.drinks.indexOf(e), e))
          .toList(),
    );
  }

  List<String> get ingredients => drinks.map((e) => e.name).toList();

  /// Каждый ингредиент установлен хотя бы в одной помпе
  bool contains(List<String> drinks) {
    return ingredients.every((ingredient) => drinks.any(ingredient.equals));
  }

  bool isReadyFor(List<UiDrink> drinks) {
    final names = drinks.names;
    return contains(names);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
