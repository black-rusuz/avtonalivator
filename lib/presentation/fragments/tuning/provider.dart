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
    cocktail = UiCocktail.custom(_settings.drinksQuantity);
  }

  void _setCocktail(UiCocktail cocktail) {
    this.cocktail = cocktail;
    notifyListeners();
  }

  void generateDrinks(int quantity) {
    cocktail = UiCocktail.custom(_settings.drinksQuantity);
    notifyListeners();
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
