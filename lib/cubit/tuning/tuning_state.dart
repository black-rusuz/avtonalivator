part of 'tuning_cubit.dart';

abstract class TuningState {}

class TuningInitial extends TuningState {}

class TuningSoloPump extends TuningState {
  final PumpModel pump;

  TuningSoloPump({required this.pump});
}
