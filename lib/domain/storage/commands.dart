import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const _commands = 'commands';

@injectable
class CommandsBox {
  static const name = 'commands';
  final _box = Hive.box(name);

  List<String> get all {
    final value = _box.get(_commands);
    return value ?? [];
  }

  void save(String command) {
    if (command.isEmpty) return;
    final list = all;
    list.add(command);
    _box.put(_commands, list);
  }

  void delete(String command) {
    final list = all;
    list.remove(command);
    _box.put(_commands, list);
  }
}
