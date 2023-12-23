import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/connection/connector.dart';
import '../../domain/logger.dart';
import '../../domain/model/device.dart';
import '../../domain/model/device_data.dart';
import '../../domain/model/drink.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final Connector _connector;

  ConnectionProvider(this._connector) {
    device = _connector.device;
    _inputSub?.cancel();
    _inputSub = _connector.input.map(_inputPrinter).listen(_inputListener);
  }

  StreamSubscription? _inputSub;
  List<String> _drinks = [];
  DeviceData data = const DeviceData();
  UiDevice? device;

  String? get drink {
    final index = data.step - 1;
    if (index < 0) return null;
    return _drinks.elementAtOrNull(index);
  }

  // * Init

  DeviceData _inputPrinter(DeviceData data) {
    Logger.log(data);
    return data;
  }

  void _inputListener(DeviceData data) {
    this.data = data;
    notifyListeners();
  }

  // * Methods

  Future<void> updateAll(List<UiDrink> drinks) {
    _drinks = drinks.names;
    final command = drinks.command;
    return _sendCommand(command);
  }

  /// TODO: тут хардкод
  Future<void> startPour() {
    _inputListener(data.copyWith(step: 1));

    const tare = 'w1';
    final mode = DeviceMode.auto.command;
    const step = 's0';

    final command = '$tare $mode $step';
    return _sendCommand(command);
  }

  Future<void> stopPour() {
    const command = 'w0 m0 s0';
    return _sendCommand(command);
  }

  Future<void> calibrate(int weight) {
    final mode = DeviceMode.calibration.command;
    final command = 'a$weight $mode';
    return _sendCommand(command);
  }

  // * Helpers

  Future<void> _sendCommand(String command) {
    return _connector.sendCommand(command);
  }

  void disconnect() async {
    device = null;
    notifyListeners();
    await _connector.disconnect();
  }

  @override
  void dispose() {
    _inputSub?.cancel();
    return super.dispose();
  }
}
