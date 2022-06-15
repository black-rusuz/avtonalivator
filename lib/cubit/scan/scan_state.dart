part of 'scan_cubit.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScanDevices extends ScanState {
  final List<BluetoothDevice> devices;

  const ScanDevices({required this.devices});

  @override
  List<Object> get props => [UniqueKey(), devices];
}

class ScanConnection extends ScanState {
  final BluetoothConnection connection;

  const ScanConnection({required this.connection});

  @override
  List<Object> get props => [connection];
}

class ScanSkip extends ScanState {}
