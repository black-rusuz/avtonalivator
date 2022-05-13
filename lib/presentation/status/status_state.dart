part of 'status_cubit.dart';

abstract class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

class StatusInitialState extends StatusState {}

class StatusSuccessState extends StatusState {
  final bool isAvailable;
  final bool isEnabled;

  const StatusSuccessState({required this.isAvailable, required this.isEnabled});

  @override
  List<Object> get props => [isAvailable, isEnabled];
}
