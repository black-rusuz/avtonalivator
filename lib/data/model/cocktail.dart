import 'package:freezed_annotation/freezed_annotation.dart';

import 'drink.dart';

part 'cocktail.freezed.dart';
part 'cocktail.g.dart';

@freezed
class ApiCocktail with _$ApiCocktail {
  const factory ApiCocktail({
    required int id,
    @Default('') String name,
    @Default('') String imageUrl,
    @Default([]) List<ApiDrink> drinks,
  }) = _ApiCocktail;

  factory ApiCocktail.fromJson(Map<String, dynamic> json) =>
      _$ApiCocktailFromJson(json);
}
