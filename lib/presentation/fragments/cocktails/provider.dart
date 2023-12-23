import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/cocktail.dart';
import '../../../domain/repository/cocktails.dart';
import '../../../domain/string_utils.dart';

@injectable
class CocktailsProvider extends ChangeNotifier {
  final CocktailsRepository _repository;

  List<UiCocktail> _cocktails = [];
  List<UiCocktail> _userCocktails = [];
  StreamSubscription? _cocktailsSub;
  StreamSubscription? _userCocktailsSub;

  CocktailsProvider(this._repository) {
    _cocktailsSub ??= _repository.hostCocktails.listen(_setCocktails);
    _userCocktailsSub ??= _repository.userCocktails.listen(_setUserCocktails);
  }

  String _searchPattern = '';
  List<String> _tuningDrinks = [];

  bool useFilter = false;

  List<UiCocktail> get cocktails => _cocktails
      .where((c) => !useFilter || c.contains(_tuningDrinks))
      .where((c) => c.name.search(_searchPattern))
      .toList();

  List<UiCocktail> get favCocktails =>
      cocktails.where((e) => e.favorite).toList();

  List<UiCocktail> get userCocktails => _userCocktails
      .where((c) => !useFilter || c.contains(_tuningDrinks))
      .where((c) => c.name.search(_searchPattern))
      .toList();

  List<String> get drinks =>
      _cocktails.expand((c) => c.drinkNames).toSet().toList();

  void searchCocktail(String pattern) {
    _searchPattern = pattern;
    notifyListeners();
  }

  void setFilter(bool value, List<String> drinks) {
    _tuningDrinks = drinks;
    useFilter = value;
    notifyListeners();
  }

  Future<void> save(UiCocktail cocktail) {
    return _repository.saveCocktail(cocktail);
  }

  Future<void> delete(UiCocktail cocktail) {
    return _repository.deleteCocktail(cocktail);
  }

  // * Private

  void _setCocktails(List<UiCocktail> cocktails) {
    _cocktails = cocktails;
    notifyListeners();
  }

  void _setUserCocktails(List<UiCocktail> cocktails) {
    _userCocktails = cocktails;
    notifyListeners();
  }

  @override
  void dispose() {
    _cocktailsSub?.cancel();
    _userCocktailsSub?.cancel();
    return super.dispose();
  }
}
