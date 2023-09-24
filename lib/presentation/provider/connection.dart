import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/connector.dart';
import '../../domain/model/device.dart';
import '../../domain/model/device_data.dart';
import '../../domain/model/pump.dart';

const _debounce = Duration(milliseconds: 400);

@injectable
class ConnectionProvider extends ChangeNotifier {
  final Connector _connector;

  StreamSubscription? _inputSub;
  Timer? _timer;

  List<String> _drinks = [];
  int _step = 0;

  ConnectionProvider(this._connector) {
    device = _connector.device;
    _inputSub?.cancel();
    _inputSub = _connector.input.map(_inputPrinter).listen(_inputListener);
  }

  UiDevice? device;
  int percent = 0;

  String? get drink {
    final index = _step - 1;
    if (index < 0) return null;
    return _drinks.elementAtOrNull(index);
  }

  // * Init

  DeviceData _inputPrinter(DeviceData data) {
    if (kDebugMode) print(data);
    return data;
  }

  void _inputListener(DeviceData data) {
    percent = data.percent;
    _step = data.step;
    notifyListeners();
  }

  // * Methods

  // void updatePump(UiPump pump) {
  //   final command = pump.command;
  //   return _sendCommand(command);
  // }

  void updateAll(List<UiPump> pumps) {
    _drinks = pumps.drinks;
    final command = pumps.command;
    return _sendCommand(command);
  }

  /// TODO: тут хардкод
  void startPour() {
    const tare = 'w1';
    final mode = DeviceMode.auto.command;
    const step = 's0';

    final command = '$tare $mode $step';
    _sendCommand(command);
    // _sendCommand('w1 m0 s0');
  }

  // * Helpers

  void _sendCommand(String command) {
    _runAsync(() => _connector.sendCommand(command));
  }

  void _runAsync(AsyncCallback callback) {
    if (_timer?.isActive == true) _timer?.cancel();
    _timer = Timer(_debounce, callback);
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
