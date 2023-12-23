import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/drink.dart';
import '../equals.dart';
import 'cocktail.dart';

final _chars = '_:a:b:c:d:e:f:g:h:i:j:k:l'.split(':').toList();

class UiDrink extends Equatable {
  final int id;
  final String name;
  final double volume;
  final bool enabled;

  const UiDrink({
    required this.id,
    required this.name,
    required this.volume,
  }) : enabled = volume != 0;

  factory UiDrink.fromApi(int id, ApiDrink drink) {
    return UiDrink(
      id: 0,
      name: drink.name,
      volume: drink.volume.toDouble(),
    );
  }

  static UiDrink get base => const UiDrink(
        id: 0,
        name: '',
        volume: 25,
      );

  String get command {
    final value = enabled ? volume.round() : 0;
    return '$_char$value';
  }

  UiDrink copyWith({
    int? id,
    String? name,
    double? volume,
    bool? enabled,
  }) {
    return UiDrink(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
    );
  }

  /// Находит напиток, соответствующий названию ингредиента,
  /// включает помпу и устанавливает объём.
  /// Если напиток не найден, помпа выключается.
  UiDrink mapCocktail(UiCocktail cocktail) {
    final drink = cocktail.drinks.firstWhereOrNull((d) => d.name.equals(name));
    return setDrink(drink);
  }

  UiDrink setDrink(UiDrink? drink) {
    final result = drink == null
        ? copyWith(enabled: false)
        : copyWith(
            name: drink.name,
            volume: drink.volume.toDouble(),
            enabled: true,
          );
    return result;
  }

  String get _char {
    return _chars[id];
  }

  @override
  List<Object?> get props => [id, name, volume, enabled];

  /// Реализация PrimaryKey для провайдера [Tuning]
  @override
  int get hashCode => id.hashCode;

  /// Реализация PrimaryKey для провайдера [Tuning]
  @override
  bool operator ==(Object other) {
    return other is UiDrink && id == other.id;
  }
}

extension Drinks on List<UiDrink> {
  String get command {
    final chars = map((p) => p._char);
    final zeros = _chars.whereNot(chars.contains).map((c) => '${c}0').join(' ');
    return zeros + ' ' + map((p) => p.command).join(' ');
  }

  List<String> get names {
    return map((drink) => drink.name).toList();
  }
}
