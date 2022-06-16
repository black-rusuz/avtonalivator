import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  bool isDiscovering = false;
  bool isConnecting = false;
  List<BluetoothDevice> devices = [];
  BluetoothConnection? connection;

  StreamSubscription<BluetoothDiscoveryResult>? devicesSubscription;
  StreamSubscription<bool>? discoveringSubscription;

  Stream<bool> get isDiscoveringStream async* {
    while (!isClosed) {
      yield await Future.delayed(
        const Duration(seconds: 1),
        () async =>
            await FlutterBluetoothSerial.instance.isDiscovering ?? false,
      );
    }
  }

  void emitProcessing() {
    if (!isClosed) {
      emit(ScanProcessing(
        isDiscovering: isDiscovering,
        isConnecting: isConnecting,
      ));
    }
  }

  Future<void> init() async {
    discover();
    scan();
  }

  void discover() async {
    await discoveringSubscription?.cancel();
    discoveringSubscription = isDiscoveringStream.listen((v) {
      isDiscovering = v;
      emitProcessing();
    });
  }

  void scan() async {
    devices = [];
    emit(ScanDevices(devices: devices));
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await devicesSubscription?.cancel();
    FlutterBluetoothSerial.instance
        .startDiscovery()
        .listen((result) => addDevice(result.device));
  }

  void addDevice(BluetoothDevice device) async {
    if (!devices.contains(device)) devices.add(device);
    emit(ScanDevices(devices: devices));
  }

  void connect(String name, String address) async {
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
    await discoveringSubscription?.cancel();
    await devicesSubscription?.cancel();
    return super.close();
  }
}
