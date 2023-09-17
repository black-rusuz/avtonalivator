import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

part 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial()) {
    final devices = List.generate(
      20,
      (index) => BluetoothDevice(
        address: index.hashCode.toString(),
        name: 'Device $index',
      ),
    );
    emit(ScanFulfilled(devices: devices));
  }

  Stream<bool> get isDiscovering => const Stream.empty();

  void scan() {}
}
