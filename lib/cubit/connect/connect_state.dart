part of 'connect_cubit.dart';

abstract class ConnectState {}

class ConnectInitial extends ConnectState {}

class ConnectSuccess extends ConnectState {
  final String name;
  final String address;

  ConnectSuccess({required this.name, required this.address});
}
