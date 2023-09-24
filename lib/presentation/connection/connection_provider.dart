import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../data/connection/fbs_connector.dart';
import '../../domain/model/device.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final FbsConnector _connector;

  UiDevice? device;

  ConnectionProvider(this._connector) {
    final _device = _connector.device;
    device = _device == null ? null : UiDevice.fromLib(_device);
  }

  Stream<String> get _input => _connector.input;
  StreamSubscription? _inputSub;

  Future<void> sendPour() async {
    _inputSub?.cancel();
    _inputSub = _input.listen(_streamListener);
  }

  void disconnect() async {
    device = null;
    notifyListeners();
    await _connector.disconnect();
  }

  Future<void> _sendCommand(String command) {
    return _connector.sendCommand(command);
  }

  @override
  void dispose() {
    _inputSub?.cancel();
    return super.dispose();
  }
}

void _streamListener(String event) {
  print(event);
}
