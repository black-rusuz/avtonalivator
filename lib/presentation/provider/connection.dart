import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/connector.dart';
import '../../domain/model/device.dart';
import '../../domain/model/device_data.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final Connector _connector;

  UiDevice? device;

  ConnectionProvider(this._connector) {
    device = _connector.device;
  }

  StreamSubscription? _inputSub;

  Future<void> sendCommand(String command) {
    return _connector.sendCommand(command);
  }

  Future<void> sendPour() async {
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

void _streamListener(DeviceData output) {
  print(output);
}
