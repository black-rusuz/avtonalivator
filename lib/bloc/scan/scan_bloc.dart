import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

part 'scan_event.dart';

part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitialState()) {
    on<ScanInitialEvent>(_init);
    on<ScanNewDeviceEvent>(_addDevice);
    on<ScanDevicePickedEvent>(_connectToDevice);
    on<ScanDeviceConnectedEvent>(_pushHome);
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

  FutureOr<void> _connectToDevice(
    ScanDevicePickedEvent event,
    Emitter<ScanState> emit,
  ) {
    _connection?.close();
    BluetoothConnection.toAddress(event.address).then((con) {
      if (con.isConnected) {
        _connection = con;
        add(ScanDeviceConnectedEvent(connection: _connection!));
      }
      //TODO: принт
    }).catchError((error) => print(error));
  }

  @override
  Future<void> close() async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await _devicesSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _pushHome(
    ScanDeviceConnectedEvent event,
    Emitter<ScanState> emit,
  ) {
    emit(ScanDeviceConnectedState(connection: _connection!));
  }
}
