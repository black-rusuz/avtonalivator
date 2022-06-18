import 'package:equatable/equatable.dart';

class CocktailModel extends Equatable {
  final int id;
  final String name;
  final String? imageUrl;
  final String? drinkA;
  final String? drinkB;
  final String? drinkC;
  final String? drinkD;
  final String? drinkE;
  final String? drinkF;
  final int? volumeA;
  final int? volumeB;
  final int? volumeC;
  final int? volumeD;
  final int? volumeE;
  final int? volumeF;
  final String? description;

  const CocktailModel({
    required this.id,
    required this.name,
    this.imageUrl,
    this.drinkA,
    this.drinkB,
    this.drinkC,
    this.drinkD,
    this.drinkE,
    this.drinkF,
    this.volumeA,
    this.volumeB,
    this.volumeC,
    this.volumeD,
    this.volumeE,
    this.volumeF,
    this.description,
  });

  List<String> get ingredients => [
        if (drinkA != null) drinkA!,
        if (drinkB != null) drinkB!,
        if (drinkC != null) drinkC!,
        if (drinkD != null) drinkD!,
        if (drinkE != null) drinkE!,
        if (drinkF != null) drinkF!,
      ];

  bool contains(List<String> drinks) => ingredients.every((ingredient) => drinks
      .map((drink) => drink.toLowerCase())
      .toList()
      .contains(ingredient.toLowerCase()));

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        drinkA,
        drinkB,
        drinkC,
        drinkD,
        drinkE,
        drinkF,
        volumeA,
        volumeB,
        volumeC,
        volumeD,
        volumeE,
        volumeF,
      ];
}
