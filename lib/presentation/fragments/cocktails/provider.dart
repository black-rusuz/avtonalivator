import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/repository/cocktails_repository.dart';
import '../../search_utils.dart';

@injectable
class CocktailsProvider extends ChangeNotifier {
  final CocktailsRepository _repository;

  CocktailsProvider(this._repository) {
    _cocktailsSubscription?.cancel();
    _cocktailsSubscription = _repository.cocktails.listen(_setCocktails);
  }

  String _searchPattern = '';
  List<String> _pumpDrinks = [];
  List<UiCocktail> _cocktails = [];
  StreamSubscription? _cocktailsSubscription;

  bool useFilter = false;

  List<UiCocktail> get cocktails => _cocktails
      .where((c) => !useFilter || c.contains(_pumpDrinks))
      .where((c) => c.name.search(_searchPattern))
      .toList();

  List<String> get drinks =>
      _cocktails.expand((c) => c.ingredients).toSet().toList();

  void searchCocktail(String pattern) {
    _searchPattern = pattern;
    notifyListeners();
  }

  void setFilter(List<String> drinks, bool value) {
    _pumpDrinks = drinks;
    useFilter = value;
    notifyListeners();
  }

  // * Private

  void _setCocktails(List<UiCocktail> cocktails) {
    _cocktails = cocktails;
    notifyListeners();
  }

  @override
  void dispose() {
    _cocktailsSubscription?.cancel();
    return super.dispose();
  }
}
