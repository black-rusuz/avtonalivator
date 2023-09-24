import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/pump.dart';
import '../../../domain/storage/settings.dart';

@injectable
class TuningProvider extends ChangeNotifier {
  final SettingsBox _settings;

  TuningProvider(this._settings) {
    generatePumps(_settings.pumpsQuantity);
  }

  List<UiPump> pumps = [];

  void generatePumps(int quantity) {
    pumps = List.generate(
      quantity,
      (index) => UiPump.base.copyWith(id: ++index),
    );
    notifyListeners();
  }

  void updatePump(UiPump pump) {
    pumps.update(pump);
    notifyListeners();
  }
}

extension _Update<T> on List<T> {
  void update(T element) {
    if (contains(element)) {
      final index = indexOf(element);
      this[index] = element;
    }
  }
}
