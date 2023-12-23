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

  void _setCocktail(UiCocktail cocktail) {
    this.cocktail = cocktail;
    notifyListeners();
  }

  void createCocktail(int quantity) {
    final cocktail = UiCocktail.custom(_settings.drinksQuantity);
    _setCocktail(cocktail);
  }

  void updateDrink(UiDrink drink) {
    cocktail = cocktail.copyWith(name: '');
    cocktail.updateDrink(drink);
    notifyListeners();
  }

  void setCocktail(UiCocktail cocktail) {
    _setCocktail(cocktail);
  }
}
