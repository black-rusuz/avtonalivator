import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../equals.dart';
import 'cocktail.dart';

class UiPump extends Equatable {
  final int id;
  final String name;
  final double volume;
  final bool enabled;

  const UiPump({
    required this.id,
    required this.name,
    required this.volume,
    required this.enabled,
  });

  static UiPump get base => const UiPump(
        id: 0,
        name: '',
        volume: 25,
        enabled: true,
      );

  String get command {
    final value = enabled ? volume.round() : 0;
    return '$liter$value';
  }

  UiPump copyWith({
    int? id,
    String? name,
    double? volume,
    bool? enabled,
  }) {
    return UiPump(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      enabled: enabled ?? this.enabled,
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
        ? copyWith(enabled: false)
        : copyWith(
            name: drink.name,
            volume: drink.volume.toDouble(),
            enabled: true,
          );
    return result;
  }

  @override
  List<Object?> get props => [id, name, volume, enabled];

  /// Реализация PrimaryKey для провайдера [Tuning]
  @override
  int get hashCode => id.hashCode;

  /// Реализация PrimaryKey для провайдера [Tuning]
  @override
  bool operator ==(Object other) {
    return other is UiPump && id == other.id;
  }
}

extension Drinks on List<UiPump> {
  String get command {
    return map((p) => p.command).join(' ');
  }

  List<String> get drinks {
    return map((drink) => drink.name).toList();
  }
}
