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

  UiDevice? device;

  ConnectionProvider(this._connector) {
    device = _connector.device;
    _connector.input.listen(print);
  }

  Timer? _timer;
  StreamSubscription? _inputSub;

  void updatePump(UiPump pump) {
    final liter = pump.liter;
    final volume = pump.isEnabled ? pump.volume : 0;

    final command = '$liter$volume';
    return _sendCommand(command);
  }

  void sendPour() {}

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
