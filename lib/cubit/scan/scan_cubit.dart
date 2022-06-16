import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  List<BluetoothDevice> devices = [];
  BluetoothConnection? connection;

  StreamSubscription<BluetoothDiscoveryResult>? devicesSubscription;

  Stream<bool> get isDiscoveringStream async* {
    while (!isClosed) {
      yield await Future.delayed(
        const Duration(seconds: 1),
        () async =>
            await FlutterBluetoothSerial.instance.isDiscovering ?? false,
      );
    }
  }

  void init() async {
    scan();
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
    emit(ScanConnecting());
    await connection?.close();
    BluetoothConnection.toAddress(address).then((attempt) {
      if (attempt.isConnected) {
        connection = attempt;
        emit(ScanConnected(connection: attempt, name: name, address: address));
      } else {
        // TODO: ошибка
        emit(ScanDevices(devices: devices));
      }
    }).onError((error, stackTrace) {
      // TODO: ошибка
      emit(ScanDevices(devices: devices));
    });
  }

  void skip() => emit(ScanSkipped());

  @override
  Future<void> close() async {
    await FlutterBluetoothSerial.instance.cancelDiscovery();
    await devicesSubscription?.cancel();
    return super.close();
  }
}
