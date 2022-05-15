import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

part 'scan_event.dart';

part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitialState()) {
    on<ScanInitialEvent>(_init);
    on<ScanNewDeviceEvent>(_addDevice);
  }

  final List<BluetoothDevice> _devices = [];

  StreamSubscription<BluetoothDiscoveryResult>? _devicesSubscription;

  FutureOr<void> _init(
    ScanInitialEvent event,
    Emitter<ScanState> emit,
  ) async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await _devicesSubscription?.cancel();
    _devices.clear();
    _devicesSubscription = FlutterBluetoothSerial.instance
        .startDiscovery()
        .listen((result) => add(ScanNewDeviceEvent(device: result.device)));
    emit(ScanDevicesFetchedState(devices: _devices));
  }

  FutureOr<void> _addDevice(
    ScanNewDeviceEvent event,
    Emitter<ScanState> emit,
  ) async {
    if (!_devices.contains(event.device)) _devices.add(event.device);
    emit(ScanDevicesFetchedState(devices: _devices));
  }

  @override
  Future<void> close() async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await _devicesSubscription?.cancel();
    return super.close();
  }
}
