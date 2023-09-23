part of 'scan_cubit.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitial extends ScanState {}

class AutoConnect extends ScanState {
  final UiDevice knownDevice;
  final bool isConnecting;

  const AutoConnect(
    this.knownDevice,
    this.isConnecting,
  );
}

class ScanFulfilled extends ScanState {
  final List<UiDevice> devices;

  const ScanFulfilled({
    required this.devices,
  });

  @override
  List<Object?> get props => [
        [...devices],
      ];
}
