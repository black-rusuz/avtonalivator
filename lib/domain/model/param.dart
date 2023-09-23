import 'package:equatable/equatable.dart';

class Param<T> extends Equatable {
  final String key;
  final String title;
  final String? description;
  final T value;
  final List<T> options;

  const Param({
    required this.key,
    required this.title,
    this.description,
    required this.value,
    this.options = const [],
  });

  @override
  List<Object?> get props => [
        key,
        title,
        description,
        value,
        [...options],
      ];
}
