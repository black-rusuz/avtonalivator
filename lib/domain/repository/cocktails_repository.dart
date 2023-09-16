import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/data_source.dart';
import '../model/cocktail.dart';

@singleton
class CocktailsRepository {
  final DataSource _source;

  CocktailsRepository(this._source) {
    getCocktails().then(_cocktails.add);
  }

  final _cocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);

  Future<List<UiCocktail>> getCocktails() async {
    final list = await _source.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }

  Stream<List<UiCocktail>> get cocktails {
    return _cocktails;
  }
}
