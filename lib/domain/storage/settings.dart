import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/device.dart';
import '../model/param.dart';

const _lastDevice = 'lastDevice';

@injectable
class SettingsBox {
  static const name = 'settings';
  final _box = Hive.box(name);

  // * Generic

  T getParam<T>(String key, T defaultValue) {
    final value = _box.get(key);
    return value ?? defaultValue;
  }

  void setParam<T>(String key, T value) {
    _box.put(key, value);
  }

  // * Others

  UiDevice? get lastDevice {
    final value = _box.get(_lastDevice);
    return value;
  }

  set lastDevice(UiDevice? value) {
    _box.put(_lastDevice, value);
  }

  // * Getters

  bool get autoConnect => getParam(ParamKey.autoConnect, false);

  int get drinksQuantity => getParam(ParamKey.drinksQuantity, 6);
}
