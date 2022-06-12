part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeAllPumpsState extends HomeState {
  final List<PumpModel> pumps;

  const HomeAllPumpsState({required this.pumps});

  @override
  List<Object> get props => [pumps];
}

class HomePumpDefinedState extends HomeState {
  final PumpModel pump;

  const HomePumpDefinedState({required this.pump});

  @override
  List<Object> get props => [pump];
}
