import 'package:equatable/equatable.dart';

class DrinkMapModel extends Equatable {
  final Map<String, int> drink1;
  final Map<String, int> drink2;
  final Map<String, int> drink3;
  final Map<String, int> drink4;
  final Map<String, int> drink5;
  final Map<String, int> drink6;

  const DrinkMapModel({
    required this.drink1,
    required this.drink2,
    required this.drink3,
    required this.drink4,
    required this.drink5,
    required this.drink6,
  });

  @override
  List<Object?> get props => [
        drink1,
        drink2,
        drink3,
        drink4,
        drink5,
        drink6,
      ];
}
