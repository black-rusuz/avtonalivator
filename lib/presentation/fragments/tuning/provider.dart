import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/model/drink.dart';
import '../../../domain/storage/settings.dart';

@injectable
class TuningProvider extends ChangeNotifier {
  final SettingsBox _settings;
  late UiCocktail cocktail;

  TuningProvider(this._settings) {
    final quantity = _settings.drinksQuantity;
    createCocktail(quantity);
  }

  void setCocktail(UiCocktail cocktail) {
    this.cocktail = cocktail;
    notifyListeners();
  }

  void createCocktail(int quantity) {
    final cocktail = UiCocktail.custom(_settings.drinksQuantity);
    setCocktail(cocktail);
  }

  void updateDrink(UiDrink drink) {
    cocktail = cocktail.updateDrink(drink);
    setCocktail(cocktail);
  }
}
