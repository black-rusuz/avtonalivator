import 'package:equatable/equatable.dart';

import '../../data/model/drink.dart';

class Drink extends Equatable {
  final String name;
  final int volume;

  const Drink({
    required this.name,
    required this.volume,
  });

  factory Drink.fromApi(ApiDrink drink) {
    return Drink(name: drink.name, volume: drink.volume);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
