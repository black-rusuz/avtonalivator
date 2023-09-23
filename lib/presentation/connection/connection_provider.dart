import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../data/connector.dart';
import '../../domain/model/device.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final Connector _connector;

  UiDevice? device;

  ConnectionProvider(this._connector) {
    final _device = _connector.device;
    device = _device == null ? null : UiDevice.fromLib(_device);
  }

  void sendCommand() {

  }

  void disconnect() async {
    device = null;
    notifyListeners();
    await _connector.disconnect();
  }
}
