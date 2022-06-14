part of 'launch_cubit.dart';

@immutable
abstract class LaunchState extends Equatable {
  const LaunchState();

  @override
  List<Object> get props => [];
}

class LaunchInitial extends LaunchState {}

class LaunchAnimate extends LaunchState {}

class LaunchStatus extends LaunchState {
  final bool isAvailable;
  final bool isEnabled;

  const LaunchStatus({
    required this.isAvailable,
    required this.isEnabled,
  });

  @override
  List<Object> get props => [isAvailable, isEnabled];
}
