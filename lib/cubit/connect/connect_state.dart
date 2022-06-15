part of 'connect_cubit.dart';

abstract class ConnectState {}

class ConnectionInitial extends ConnectState {}

class ConnectionSuccess extends ConnectState {
  final String name;
  final String address;

  ConnectionSuccess({required this.name, required this.address});
}
