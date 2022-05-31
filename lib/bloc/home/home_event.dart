part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();

  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {
  final BluetoothConnection connection;

  const HomeInitialEvent({required this.connection});
}
