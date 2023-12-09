import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/data_source.dart';
import '../model/cocktail.dart';

@singleton
class CocktailsRepository {
  final DataSource _source;
  final _cocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);

  CocktailsRepository(this._source) {
    getCocktails().then(_cocktails.add);
  }

  Stream<List<UiCocktail>> get stream => _cocktails;

  Future<List<UiCocktail>> getCocktails() async {
    final list = await _source.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }
}
