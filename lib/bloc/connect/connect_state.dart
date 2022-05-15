part of 'connect_bloc.dart';

@immutable
abstract class ConnectState {
  const ConnectState();

  List<Object> get props => [];
}

class ConnectInitialState extends ConnectState {}
