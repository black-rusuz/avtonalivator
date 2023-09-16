import 'package:equatable/equatable.dart';

import '../../data/model/drink.dart';

class UiDrink extends Equatable {
  final String name;
  final int volume;

  const UiDrink({
    required this.name,
    required this.volume,
  });

  factory UiDrink.fromApi(ApiDrink drink) {
    return UiDrink(name: drink.name, volume: drink.volume);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
