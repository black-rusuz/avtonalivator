import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/storage/settings.dart';

@injectable
class SettingsProvider extends ChangeNotifier {
  final SettingsBox _box;

  SettingsProvider(this._box);

  dynamic getParam(String key, dynamic defaultValue) {
    return _box.getParam(key, defaultValue);
  }

  void setParam(String key, dynamic value) {
    _box.setParam(key, value);
    notifyListeners();
  }
}
