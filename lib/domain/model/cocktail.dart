import 'package:equatable/equatable.dart';

import '../../data/model/cocktail.dart';
import 'drink.dart';

class UiCocktail extends Equatable {
  final int id;
  final String name;
  final String image;
  final List<UiDrink> drinks;

  const UiCocktail({
    required this.id,
    required this.name,
    required this.image,
    required this.drinks,
  });

  factory UiCocktail.fromApi(ApiCocktail cocktail) {
    return UiCocktail(
      id: cocktail.id,
      name: cocktail.name,
      image: cocktail.imageUrl,
      drinks: cocktail.drinks.map(UiDrink.fromApi).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        [...drinks],
      ];
}
