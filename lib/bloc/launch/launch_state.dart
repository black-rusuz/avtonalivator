part of 'launch_bloc.dart';

@immutable
abstract class LaunchState {
  const LaunchState();

  List<Object> get props => [];
}

class LaunchInitialState extends LaunchState {}

class LaunchStatusFetchedState extends LaunchState {
  final bool isAvailable;
  final bool isEnabled;

  const LaunchStatusFetchedState({
    required this.isAvailable,
    required this.isEnabled,
  });

  @override
  List<Object> get props => [isAvailable, isEnabled];
}
