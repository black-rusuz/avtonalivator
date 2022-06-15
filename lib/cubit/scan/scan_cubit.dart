import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  final List<BluetoothDevice> devices = [];
  BluetoothConnection? connection;
  bool isDiscovering = false;
  bool isConnecting = false;

  StreamSubscription<BluetoothDiscoveryResult>? devicesSubscription;
  StreamSubscription<bool>? discoveringSubscription;

  void emitProcessing() {
    if (!isClosed) {
      emit(ScanProcessing(
        isDiscovering: isDiscovering,
        isConnecting: isConnecting,
      ));
    }
  }

  Stream<bool> get isDiscoveringStream async* {
    while (true) {
      yield await Future.delayed(
        const Duration(seconds: 1),
        () async {
          isDiscovering =
              await FlutterBluetoothSerial.instance.isDiscovering ?? false;
          emitProcessing();
          return isDiscovering;
        },
      );
    }
  }

  Future<void> init() async {
    discoveringSubscription = isDiscoveringStream.listen((_) {});
    devices.clear();
    emit(ScanDevices(devices: devices));
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await devicesSubscription?.cancel();
    devicesSubscription = FlutterBluetoothSerial.instance
        .startDiscovery()
        .listen((result) => addDevice(result.device));
  }

  addDevice(BluetoothDevice device) async {
    if (!devices.contains(device)) devices.add(device);
    emit(ScanDevices(devices: devices));
  }

  Future<void> connect(String name, String address) async {
    isConnecting = true;
    emitProcessing();
    await connection?.close();
    BluetoothConnection attempt = await BluetoothConnection.toAddress(address);
    if (attempt.isConnected) {
      connection = attempt;
      isConnecting = false;
      emit(ScanConnected(connection: attempt, name: name, address: address));
    }
    //TODO: ошибка подключения
  }

  void skip() => emit(ScanSkipped());

  @override
  Future<void> close() async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await devicesSubscription?.cancel();
    await discoveringSubscription?.cancel();
    return super.close();
  }
}
