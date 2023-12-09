import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/model/pump.dart';
import '../../../domain/storage/settings.dart';

@injectable
class TuningProvider extends ChangeNotifier {
  final SettingsBox _settings;

  TuningProvider(this._settings) {
    generatePumps(_settings.pumpsQuantity);
  }

  String? cocktailName;
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

  void setCocktail(UiCocktail? cocktail) {
    if (cocktail == null) return cocktailName = null;

    cocktailName = cocktail.name;
    pumps = pumps.map((e) => e.copyWith(enabled: false)).toList();

    for (int i = 0; i < cocktail.drinks.length; i++) {
      final drink = cocktail.drinks[i];
      final pump = pumps[i];
      pumps[i] = pump.setDrink(drink);
      notifyListeners();
    }
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
