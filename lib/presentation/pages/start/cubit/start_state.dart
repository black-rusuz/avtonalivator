part of 'start_cubit.dart';

abstract class StartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartInitial extends StartState {}

class StartAnimate extends StartState {}

class StartFulfilled extends StartState {
  final bool btAvailable;
  final bool btEnabled;

  StartFulfilled({required this.btAvailable, required this.btEnabled});

  @override
  List<Object?> get props => [
        btAvailable,
        btEnabled,
      ];
}
