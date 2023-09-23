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
  final bool isConnecting;

  const ScanAutoConnect(
    this.knownDevice,
    this.isConnecting,
  );
}

class ScanConnected extends ScanState {}

class ScanError extends ScanState {}

// * Build

class ScanConnecting extends ScanState {}

class ScanFulfilled extends ScanState {
  final List<UiDevice> devices;

  const ScanFulfilled({
    required this.devices,
  });

  @override
  List<Object?> get props => [
        UniqueKey(),
        [...devices],
      ];
}
