part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeConnectEvent extends HomeEvent {
  final BluetoothConnection connection;

  const HomeConnectEvent({required this.connection});

  @override
  List<Object> get props => [connection];
}

class HomeSetPumpEvent extends HomeEvent {
  final PumpModel pump;

  const HomeSetPumpEvent({required this.pump});

  @override
  List<Object> get props => [pump];
}

class HomePourEvent extends HomeEvent {}
