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

  StreamSubscription<BluetoothDiscoveryResult>? devicesSubscription;

  Stream<bool?> get isDiscoveringStream async* {
    while (true) {
      yield await Future.delayed(
        const Duration(seconds: 1),
        () async => await FlutterBluetoothSerial.instance.isDiscovering,
      );
    }
  }

  Future<void> init() async {
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

  Future<void> connect(String address) async {
    await connection?.close();
    BluetoothConnection.toAddress(address).then((v) {
      if (v.isConnected) {
        connection = v;
        emit(ScanConnection(connection: v));
      }
      //TODO: ошибка подключения
    });
  }

  void skip() => emit(ScanSkip());

  @override
  Future<void> close() async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await devicesSubscription?.cancel();
    return super.close();
  }
}
