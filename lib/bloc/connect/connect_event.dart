part of 'connect_bloc.dart';

@immutable
abstract class ConnectEvent {
  const ConnectEvent();

  List<Object> get props => [];
}

class ConnectInitialEvent extends ConnectEvent {}
