import 'package:collection/collection.dart';

final _notNumber = RegExp(r'[^0-9.]+');

extension Find on List<String> {
  String find(String pattern) {
    return _find((element) => element.contains(pattern));
  }

  String _find(bool Function(String element) test) {
    return firstWhereOrNull(test) ?? '';
  }
}

extension AsNumber on String {
  String get value {
    return split(': ').lastOrNull ?? '';
  }

  num get asNumber {
    final number = replaceAll(_notNumber, '');
    return num.tryParse(number) ?? 0;
  }
}
