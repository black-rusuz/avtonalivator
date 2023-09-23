import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const _liters = 'liters';

@injectable
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
