import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitialState()) {
    on<ScanInitialEvent>(_init);
    on<ScanDiscoveredDeviceEvent>(_addDevice);
    on<ScanDevicePickedEvent>(_connectToDevice);
    on<ScanDeviceConnectedEvent>(_pushHome);
    on<ScanConnectionSkippedEvent>(_skipConnection);
  }

  final List<BluetoothDevice> _devices = [];
  BluetoothConnection? _connection;

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
        .listen(
            (result) => add(ScanDiscoveredDeviceEvent(device: result.device)));
    emit(ScanDevicesFetchedState(devices: _devices));
  }

  FutureOr<void> _addDevice(
    ScanDiscoveredDeviceEvent event,
    Emitter<ScanState> emit,
  ) async {
    if (!_devices.contains(event.device)) _devices.add(event.device);
    emit(ScanDevicesFetchedState(devices: _devices));
  }

  FutureOr<void> _connectToDevice(
    ScanDevicePickedEvent event,
    Emitter<ScanState> emit,
  ) {
    _connection?.close();
    BluetoothConnection.toAddress(event.address).then((connection) {
      _connection?.dispose();
      if (connection.isConnected) {
        _connection = connection;
        add(ScanDeviceConnectedEvent(connection: _connection!));
      }
      //TODO: ошибка подключения
    });
  }

  FutureOr<void> _pushHome(
    ScanDeviceConnectedEvent event,
    Emitter<ScanState> emit,
  ) {
    emit(ScanDeviceConnectedState(connection: _connection!));
  }

  FutureOr<void> _skipConnection(
    ScanConnectionSkippedEvent event,
    Emitter<ScanState> emit,
  ) {
    emit(ScanConnectionSkippedState());
  }

  @override
  Future<void> close() async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await _devicesSubscription?.cancel();
    return super.close();
  }
}
