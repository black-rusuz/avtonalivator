// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiCocktail _$$_ApiCocktailFromJson(Map<String, dynamic> json) =>
    _$_ApiCocktail(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
      recipe: json['recipe'] as String? ?? '',
      drinks: (json['drinks'] as List<dynamic>?)
              ?.map((e) => ApiDrink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ApiCocktailToJson(_$_ApiCocktail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'recipe': instance.recipe,
      'drinks': instance.drinks.map((e) => e.toJson()).toList(),
    };
