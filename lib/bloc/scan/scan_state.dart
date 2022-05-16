part of 'scan_bloc.dart';

@immutable
abstract class ScanState {
  const ScanState();

  List<Object> get props => [];
}

class ScanInitialState extends ScanState {}

class ScanDevicesFetchedState extends ScanState {
  final List<BluetoothDevice> devices;

  const ScanDevicesFetchedState({required this.devices});

  @override
  List<Object> get props => [devices];
}

class ScanDeviceConnectedState extends ScanState {
  final BluetoothConnection connection;

  const ScanDeviceConnectedState({required this.connection});

  @override
  List<Object> get props => [connection];
}
