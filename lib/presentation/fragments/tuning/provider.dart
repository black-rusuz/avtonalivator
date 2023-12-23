import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/connection/device_methods.dart';
import '../../../domain/model/cocktail.dart';
import '../../../domain/model/drink.dart';
import '../../../domain/storage/settings.dart';

@injectable
class TuningProvider extends ChangeNotifier {
  final DeviceMethods _methods;
  final SettingsBox _settings;
  late UiCocktail cocktail;

  TuningProvider(this._methods, this._settings) {
    final quantity = _settings.drinksQuantity;
    createCocktail(quantity);
  }

  void createCocktail(int quantity) {
    final cocktail = UiCocktail.custom(_settings.drinksQuantity);
    setCocktail(cocktail);
  }

  void setCocktail(UiCocktail cocktail) {
    this.cocktail = cocktail;
    _methods.setCocktail(cocktail);
    notifyListeners();
  }

  void updateDrink(UiDrink drink) {
    cocktail = cocktail.copyWith(name: '');
    setCocktail(cocktail);
    cocktail.updateDrink(drink);
    notifyListeners();
  }
}
