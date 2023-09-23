import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/device.dart';

const _autoConnect = 'autoConnect';
const _lastDevice = 'lastDevice';
const _pumpsQuantity = 'pumpsQuantity';

@injectable
class SettingsBox {
  static const name = 'settings';
  final _box = Hive.box(name);

  bool get autoConnect {
    final value = _box.get(_autoConnect);
    return value ?? false;
  }

  set autoConnect(bool value) {
    _box.put(_autoConnect, value);
  }

  UiDevice? get lastDevice {
    final value = _box.get(_lastDevice);
    return value;
  }

  set lastDevice(UiDevice? value) {
    _box.put(_lastDevice, value);
  }

  int get pumpsQuantity {
    final value = _box.get(_pumpsQuantity);
    return value ?? 6;
  }

  set pumpsQuantity(int value) {
    _box.put(_pumpsQuantity, value);
  }
}
