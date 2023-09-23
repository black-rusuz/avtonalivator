part of 'scan_cubit.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitial extends ScanState {}

// * Listen

class ScanAutoConnect extends ScanState {
  final UiDevice knownDevice;

  const ScanAutoConnect(this.knownDevice);
}

class ScanConnected extends ScanState {}

class ScanError extends ScanState {}

// * Build

class ScanFulfilled extends ScanState {
  final List<UiDevice> devices;
  final bool isConnecting;

  const ScanFulfilled({
    required this.devices,
    this.isConnecting = false,
  });

  @override
  List<Object?> get props => [
        UniqueKey(),
        [...devices],
        isConnecting,
      ];
}
