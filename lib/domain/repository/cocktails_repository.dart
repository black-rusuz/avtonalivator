import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../datasource/cocktails_source.dart';
import '../model/cocktail.dart';

@singleton
class CocktailsRepository {
  final CocktailsSource _source;

  CocktailsRepository(this._source) {
    getCocktails();
  }

  final _cocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);

  Future<List<UiCocktail>> getCocktails() async {
    final list = await _source.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    _cocktails.add(cocktails);
    return cocktails;
  }

  Stream<List<UiCocktail>> get cocktails {
    return _cocktails;
  }
}
