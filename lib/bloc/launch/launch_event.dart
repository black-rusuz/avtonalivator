part of 'launch_bloc.dart';

@immutable
abstract class LaunchEvent {
  const LaunchEvent();

  List<Object> get props => [];
}

class LaunchInitialEvent extends LaunchEvent {}
