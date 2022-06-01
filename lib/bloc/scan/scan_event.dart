part of 'scan_bloc.dart';

@immutable
abstract class ScanEvent {
  const ScanEvent();

  List<Object> get props => [];
}

class ScanInitialEvent extends ScanEvent {}

class ScanDiscoveredDeviceEvent extends ScanEvent {
  final BluetoothDevice device;

  const ScanDiscoveredDeviceEvent({required this.device});

  @override
  List<Object> get props => [device];
}

class ScanDevicePickedEvent extends ScanEvent {
  final String address;

  const ScanDevicePickedEvent({required this.address});

  @override
  List<Object> get props => [address];
}

class ScanDeviceConnectedEvent extends ScanEvent {
  final BluetoothConnection connection;

  const ScanDeviceConnectedEvent({required this.connection});

  @override
  List<Object> get props => [connection];
}

class ScanConnectionSkippedEvent extends ScanEvent {}
