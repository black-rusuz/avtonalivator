import 'package:equatable/equatable.dart';

import 'cocktail.dart';

class UiPump extends Equatable {
  final int id;
  final String name;
  final double volume;
  final bool isEnabled;

  const UiPump({
    required this.id,
    required this.name,
    required this.volume,
    required this.isEnabled,
  });

  static UiPump get base => const UiPump(
        id: 0,
        name: 'Напиток',
        volume: 25,
        isEnabled: true,
      );

  UiPump copyWith({
    int? id,
    String? name,
    double? volume,
    bool? isEnabled,
  }) {
    return UiPump(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  String get liter {
    switch (id) {
      case 1:
        return 'a';
      case 2:
        return 'b';
      case 3:
        return 'c';
      case 4:
        return 'd';
      case 5:
        return 'e';
      case 6:
        return 'f';
      case 7:
        return 'g';
      case 8:
        return 'h';
      default:
        return '';
    }
  }

  UiPump mapCocktail(UiCocktail cocktail) {
    // TODO: implement mapCocktail
    throw UnimplementedError();
    //   if (name.toLowerCase() == cocktail.drinkA?.toLowerCase()) {
    //     return copyWith(
    //       name: cocktail.drinkA,
    //       volume: cocktail.volumeA?.toDouble(),
    //       isEnabled: true,
    //     );
    //   }
    //   if (name.toLowerCase() == cocktail.drinkB?.toLowerCase()) {
    //     return copyWith(
    //       name: cocktail.drinkB,
    //       volume: cocktail.volumeB?.toDouble(),
    //       isEnabled: true,
    //     );
    //   }
    //   if (name.toLowerCase() == cocktail.drinkC?.toLowerCase()) {
    //     return copyWith(
    //       name: cocktail.drinkC,
    //       volume: cocktail.volumeC?.toDouble(),
    //       isEnabled: true,
    //     );
    //   }
    //   if (name.toLowerCase() == cocktail.drinkD?.toLowerCase()) {
    //     return copyWith(
    //       name: cocktail.drinkD,
    //       volume: cocktail.volumeD?.toDouble(),
    //       isEnabled: true,
    //     );
    //   }
    //   if (name.toLowerCase() == cocktail.drinkE?.toLowerCase()) {
    //     return copyWith(
    //       name: cocktail.drinkE,
    //       volume: cocktail.volumeE?.toDouble(),
    //       isEnabled: true,
    //     );
    //   }
    //   if (name.toLowerCase() == cocktail.drinkF?.toLowerCase()) {
    //     return copyWith(
    //       name: cocktail.drinkF,
    //       volume: cocktail.volumeF?.toDouble(),
    //       isEnabled: true,
    //     );
    //   }
    //   return copyWith(isEnabled: false);
  }

  @override
  List<Object?> get props => [id, name, volume, isEnabled];

  /// Реализация PrimaryKey для Set в TuningBloc
  @override
  int get hashCode => id.hashCode;

  /// Реализация PrimaryKey для Set в TuningBloc
  @override
  bool operator ==(Object other) {
    return other is UiPump && id == other.id;
  }
}
