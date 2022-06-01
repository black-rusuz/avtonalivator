import 'package:equatable/equatable.dart';

class PumpModel extends Equatable {
  final int id;
  final String name;
  final double volume;
  final bool isEnabled;

  const PumpModel({
    required this.id,
    required this.name,
    required this.volume,
    required this.isEnabled,
  });

  String get letter {
    switch (id) {
      case (1):
        return 'a';
      case (2):
        return 'b';
      case (3):
        return 'c';
      case (4):
        return 'd';
      case (5):
        return 'e';
      case (6):
        return 'f';
      default:
        return '';
    }
  }

  PumpModel copyWith({
    int? id,
    String? name,
    double? volume,
    bool? isEnabled,
  }) {
    return PumpModel(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  List<Object?> get props => [id, name, volume, isEnabled];
}
