part of 'connect_cubit.dart';

abstract class ConnectState {}

class ConnectInitial extends ConnectState {}

class ConnectConnecting extends ConnectState {}

class ConnectConnected extends ConnectState {
  final String name;
  final String address;

  ConnectConnected({required this.name, required this.address});
}
