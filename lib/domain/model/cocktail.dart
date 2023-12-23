import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/cocktail.dart';
import '../string_utils.dart';
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

  factory UiCocktail.custom(int drinksQuantity) {
    return UiCocktail(
      id: -1,
      name: '',
      image: '',
      description: '',
      recipe: '',
      drinks: List.generate(
        drinksQuantity,
        (index) => UiDrink.base.copyWith(id: ++index),
      ),
    );
  }

  void updateDrink(UiDrink drink) {
    if (drinks.contains(drink)) {
      final index = drinks.indexOf(drink);
      drinks[index] = drink;
    }
  }

  List<String> get drinkNames => drinks.map((e) => e.name).toList();

  /// Каждый ингредиент установлен хотя бы в одной помпе
  bool contains(List<String> drinks) {
    return drinkNames.every((ingredient) => drinks.any(ingredient.equals));
  }

  bool isReadyFor(List<UiDrink> drinks) {
    final names = drinks.map((d) => d.name).toList();
    return contains(names);
  }

  String get command {
    final allChars = UiDrink.chars;
    final chars = drinks.map((p) => p.char);

    final zeros =
        allChars.whereNot(chars.contains).map((c) => '${c}0').join(' ');
    return zeros + ' ' + drinks.map((p) => p.command).join(' ');
  }

  UiCocktail copyWith({
    int? id,
    String? name,
    String? image,
    String? description,
    String? recipe,
    List<UiDrink>? drinks,
  }) {
    return UiCocktail(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      recipe: recipe ?? this.recipe,
      drinks: drinks ?? this.drinks,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
