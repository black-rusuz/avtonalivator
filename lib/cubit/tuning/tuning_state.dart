part of 'tuning_cubit.dart';

abstract class TuningState {}

class TuningInitial extends TuningState {}

class TuningPump extends TuningState {
  final PumpModel pump;

  TuningPump({required this.pump});
}
