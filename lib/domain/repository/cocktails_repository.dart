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

  final _cocktails = BehaviorSubject<List<Cocktail>>.seeded([]);

  Future<List<Cocktail>> getCocktails() async {
    final list = await _source.getCocktails();
    final cocktails = list.map(Cocktail.fromApi).toList();
    _cocktails.add(cocktails);
    return cocktails;
  }

  Stream<List<Cocktail>> get cocktails {
    return _cocktails;
  }
}
