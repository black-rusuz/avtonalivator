import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/model/drink.dart';
import '../../../domain/storage/settings.dart';

@injectable
class TuningProvider extends ChangeNotifier {
  final SettingsBox _settings;

  TuningProvider(this._settings) {
    generateDrinks(_settings.drinksQuantity);
  }

  String? cocktailName;
  List<UiDrink> drinks = [];

  void generateDrinks(int quantity) {
    drinks = List.generate(
      quantity,
      (index) => UiDrink.base.copyWith(id: ++index),
    );
    notifyListeners();
  }

  void updateDrink(UiDrink drink) {
    drinks.update(drink);
    notifyListeners();
  }

  void setCocktail(UiCocktail? cocktail) {
    if (cocktail == null) return cocktailName = null;

    cocktailName = cocktail.name;
    drinks = drinks.map((e) => e.copyWith(enabled: false)).toList();

    for (int i = 0; i < cocktail.drinks.length; i++) {
      final cocktailDrink = cocktail.drinks[i];
      final tuningDrink = drinks[i];
      drinks[i] = tuningDrink.setDrink(cocktailDrink);
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
