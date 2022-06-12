part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeSetPumpEvent extends HomeEvent {
  final PumpModel pump;

  const HomeSetPumpEvent({required this.pump});

  @override
  List<Object> get props => [pump];
}
