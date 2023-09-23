part of 'launch_cubit.dart';

abstract class LaunchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LaunchInitial extends LaunchState {}

// * Build

class LaunchAnimate extends LaunchState {}

class LaunchStatus extends LaunchState {
  final bool noPermission;
  final bool notAvailable;
  final bool enabled;

  LaunchStatus({
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

class LaunchGoScan extends LaunchState {}
