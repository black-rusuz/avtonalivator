import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

import '../../data/connector.dart';
import '../../domain/model/device.dart';

@injectable
class ConnectionProvider extends ChangeNotifier {
  final Connector _connector;

  ConnectionProvider(this._connector) {
    final _device = _connector.device;
    device = _device == null ? null : UiDevice.fromLib(_device);
  }

  UiDevice? device;

  BluetoothConnection? get connection => _connector.connection;

  void disconnect() async {
    device = null;
    notifyListeners();
    await _connector.disconnect();
  }
}
