import 'package:hive/hive.dart';

const _liters = 'liters';

class StatsBox {
  static const name = 'stats';
  final _box = Hive.box(name);

  String get liters {
    final value = _box.get(_liters);
    return value ?? '';
  }

  set liters(String value) {
    _box.put(_liters, value);
  }
}
