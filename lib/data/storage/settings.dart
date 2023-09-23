import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const _autoConnect = 'autoConnect';
const _lastAddress = 'lastAddress';
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

  // String get lastAddress {
  //   final value = _box.get(_lastAddress);
  //   return value ?? '';
  // }
  //
  // set lastAddress(String value) {
  //   _box.put(_lastAddress, value);
  // }

  int get pumpsQuantity {
    final value = _box.get(_pumpsQuantity);
    return value ?? 6;
  }

  set pumpsQuantity(int value) {
    _box.put(_pumpsQuantity, value);
  }
}
