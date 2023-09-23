part of 'scan_cubit.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitial extends ScanState {}

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
