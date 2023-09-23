import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const _lastAddress = 'lastAddress';
const _pumpsQuantity = 'pumpsQuantity';

@injectable
class SettingsBox {
  static const name = 'settings';
  final _box = Hive.box(name);

  String get lastAddress {
    final value = _box.get(_lastAddress);
    return value ?? '';
  }

  set lastAddress(String value) {
    _box.put(_lastAddress, value);
  }

  String get pumpsQuantity {
    final value = _box.get(_pumpsQuantity);
    return value ?? '';
  }

  set pumpsQuantity(String value) {
    _box.put(_pumpsQuantity, value);
  }
}
