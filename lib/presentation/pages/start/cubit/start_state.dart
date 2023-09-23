part of 'start_cubit.dart';

abstract class StartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartInitial extends StartState {}

// * Build

class StartAnimate extends StartState {}

class StartStatus extends StartState {
  final bool noPermission;
  final bool notAvailable;
  final bool enabled;

  StartStatus({
    required this.noPermission,
    required this.notAvailable,
    required this.enabled,
  });

  @override
  List<Object?> get props => [
        noPermission,
        notAvailable,
        enabled,
      ];
}

// * Listen

class StartGoScan extends StartState {}
