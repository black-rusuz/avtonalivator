part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeConnectedEvent extends HomeEvent {
  final BluetoothConnection connection;

  const HomeConnectedEvent({required this.connection});

  @override
  List<Object> get props => [connection];
}
