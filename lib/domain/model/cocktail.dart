import 'package:equatable/equatable.dart';

import '../../data/model/cocktail.dart';
import 'drink.dart';

class Cocktail extends Equatable {
  final int id;
  final String name;
  final String image;
  final List<Drink> drinks;

  const Cocktail({
    required this.id,
    required this.name,
    required this.image,
    required this.drinks,
  });

  factory Cocktail.fromApi(ApiCocktail cocktail) {
    return Cocktail(
      id: cocktail.id,
      name: cocktail.name,
      image: cocktail.imageUrl,
      drinks: cocktail.drinks.map(Drink.fromApi).toList(),
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
