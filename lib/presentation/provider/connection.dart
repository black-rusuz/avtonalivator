import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/connector.dart';
import '../../domain/model/device.dart';
import '../../domain/model/pump.dart';

const _debounce = Duration(milliseconds: 400);

@injectable
class ConnectionProvider extends ChangeNotifier {
  final Connector _connector;

  ConnectionProvider(this._connector) {
    device = _connector.device;
    _inputSub?.cancel();
    _inputSub = _connector.input.listen(print);
  }

  UiDevice? device;
  StreamSubscription? _inputSub;
  Timer? _timer;

  void updatePump(UiPump pump) {
    final command = pump.command;
    return _sendCommand(command);
  }

  void updateAll(List<UiPump> pumps) {
    final command = pumps.map((p) => p.command).join(' ');
    return _sendCommand(command);
  }

  void sendPour() {
    // _sendCommand('w1 m0 s0');
  }

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
