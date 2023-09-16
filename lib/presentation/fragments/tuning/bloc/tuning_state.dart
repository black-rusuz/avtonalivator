part of 'tuning_bloc.dart';

abstract class TuningState extends Equatable {
  const TuningState();

  @override
  List<Object?> get props => [];
}

class TuningInitial extends TuningState {}
