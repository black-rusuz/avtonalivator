part of 'scan_bloc.dart';

@immutable
abstract class ScanEvent {
  const ScanEvent();

  List<Object> get props => [];
}

class ScanInitialEvent extends ScanEvent {}

class ScanNewDeviceEvent extends ScanEvent {
  final BluetoothDevice device;

  const ScanNewDeviceEvent({required this.device});

  @override
  List<Object> get props => [];
}
