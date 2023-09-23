import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/device.dart';
import '../model/param.dart';

const _autoConnect = 'autoConnect';
const _lastDevice = 'lastDevice';
const _pumpsQuantity = 'pumpsQuantity';

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

  bool get autoConnect {
    final value = _box.get(_autoConnect);
    return value ?? false;
  }

  void setAutoConnect(bool value) {
    _box.put(_autoConnect, value);
  }

  int get pumpsQuantity {
    final value = _box.get(_pumpsQuantity);
    return value ?? 6;
  }

  void setPumpsQuantity(int value) {
    _box.put(_pumpsQuantity, value);
  }
}

extension SettingsParams on SettingsBox {
  List<Param> get params {
    return [
      Param<bool>(
        key: _autoConnect,
        title: 'Подключаться автоматически',
        description:
            'Автоматически подключаться к последнему известному устройству',
        value: getParam<bool>(_autoConnect, true),
      ),
      Param<int>(
        key: _pumpsQuantity,
        title: 'Количество ингредиентов',
        value: getParam<int>(_pumpsQuantity, 6),
      ),
    ];
  }
}
