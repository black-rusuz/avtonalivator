import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../equals.dart';
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
        name: '',
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

  /// Находит напиток, соответствующий названию ингредиента,
  /// включает помпу и устанавливает объём.
  /// Если напиток не найден, помпа выключается.
  UiPump mapCocktail(UiCocktail cocktail) {
    final drink = cocktail.drinks.firstWhereOrNull((d) => d.name.equals(name));
    final result = drink == null
        ? copyWith(isEnabled: false)
        : copyWith(
            name: drink.name,
            volume: drink.volume.toDouble(),
            isEnabled: true,
          );
    return result;
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

extension Drinks on List<UiPump> {
  List<String> get drinks {
    return map((drink) => drink.name).toList();
  }
}
