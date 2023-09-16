part of 'tuning_bloc.dart';

abstract class TuningState extends Equatable {
  const TuningState();

  @override
  List<Object?> get props => [];
}

class TuningInitial extends TuningState {}

class TuningFulfilled extends TuningState {
  final Set<UiPump> pumps;

  const TuningFulfilled({required this.pumps});

  @override
  List<Object?> get props => [
        [...pumps]
      ];
}
