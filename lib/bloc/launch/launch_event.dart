part of 'launch_bloc.dart';

@immutable
abstract class LaunchEvent extends Equatable {
  const LaunchEvent();

  @override
  List<Object> get props => [];
}

class LaunchInitialEvent extends LaunchEvent {}
