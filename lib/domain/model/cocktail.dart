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

  bool get favorite => false;

  factory UiCocktail.fromApi(ApiCocktail cocktail) {
    final apiDrinks = cocktail.drinks;
    final drinks = List.generate(
      apiDrinks.length,
      (index) => UiDrink.fromApi(index + 1, apiDrinks[index]),
    );

    return UiCocktail(
      id: cocktail.id,
      name: cocktail.name,
      image: cocktail.imageUrl,
      description: cocktail.description,
      recipe: cocktail.recipe,
      drinks: drinks,
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
        (index) => UiDrink.base.copyWith(id: index + 1),
      ),
    );
  }

  UiCocktail updateDrink(UiDrink drink) {
    if (drinks.contains(drink)) {
      final newDrinks = List.of(drinks);
      final index = newDrinks.indexOf(drink);
      newDrinks[index] = drink;
      return copyWith(drinks: newDrinks);
    }
    return this;
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
        // image,
        // description,
        // recipe,
        [...drinks],
      ];

  ApiCocktail toApi() {
    return ApiCocktail(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      imageUrl: image,
      description: description,
      recipe: recipe,
      drinks: drinks.map((d) => d.toApi()).toList(),
    );
  }
}
