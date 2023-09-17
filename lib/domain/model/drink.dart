import 'package:equatable/equatable.dart';

import '../../data/model/drink.dart';

class UiDrink extends Equatable {
  final int id;
  final String name;
  final int volume;

  const UiDrink({
    required this.id,
    required this.name,
    required this.volume,
  });

  factory UiDrink.fromApi(ApiDrink drink) {
    return UiDrink(
      id: drink.hashCode,
      name: drink.name,
      volume: drink.volume,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        volume,
      ];
}
