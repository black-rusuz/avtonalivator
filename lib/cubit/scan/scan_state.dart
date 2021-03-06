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

class ScanConnecting extends ScanState {}

class ScanConnected extends ScanState {
  final BluetoothConnection connection;
  final String name;
  final String address;

  const ScanConnected({
    required this.connection,
    required this.name,
    required this.address,
  });

  @override
  List<Object> get props => [connection];
}

class ScanSkipped extends ScanState {}
