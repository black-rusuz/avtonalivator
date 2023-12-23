import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../data/connection/fbs_adapter.dart';
import '../logger.dart';
import '../model/cocktail.dart';
import '../model/device_data.dart';

abstract interface class DeviceMethods {
  Stream<DeviceData> get deviceData;

  Future<void> setCocktail(UiCocktail cocktail);

  Future<void> startPour();

  Future<void> stopPour();

  Future<void> calibrate(int weight);

  Future<void> setLightningBrightness(int value);

  Future<void> setLightningMode(int value);
}

@Injectable(as: DeviceMethods)
class FbsDeviceMethods implements DeviceMethods {
  final FbsAdapter _adapter;

  FbsDeviceMethods(this._adapter);

  @override
  Stream<DeviceData> get deviceData {
    return _adapter.input.distinct(listEquals).map(DeviceData.fromBytes);
  }

  @override
  Future<void> setCocktail(UiCocktail cocktail) {
    final command = cocktail.command;
    return _sendCommand(command);
  }

  @override
  Future<void> startPour() {
    const tare = 'w1';
    final mode = DeviceMode.auto.command;
    const step = 's0';

    final command = '$tare $mode $step';
    return _sendCommand(command);
  }

  @override
  Future<void> stopPour() {
    const command = 'w0 m0 s0';
    return _sendCommand(command);
  }

  @override
  Future<void> calibrate(int weight) {
    final mode = DeviceMode.calibration.command;
    final command = 'a$weight $mode';
    return _sendCommand(command);
  }

  @override
  Future<void> setLightningMode(int value) {
    // TODO: implement setLightningMode
    throw UnimplementedError();
  }

  @override
  Future<void> setLightningBrightness(int value) {
    // TODO: implement setLightningBrightness
    throw UnimplementedError();
  }

  Future<void> _sendCommand(String command) {
    Logger.log(command, 'Command');
    command = '$command\r';

    final chars = utf8.encode(command);
    final bytes = Uint8List.fromList(chars);

    return _adapter.send(bytes);
  }
}
