import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/data_source.dart';
import '../../data/local_cocktails.dart';
import '../model/cocktail.dart';

@singleton
class CocktailsRepository {
  final DataSource _source;
  final LocalCocktails _local;

  final _hostCocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);
  final _userCocktails = BehaviorSubject<List<UiCocktail>>.seeded([]);

  CocktailsRepository(this._source, this._local) {
    getCocktails().then(_hostCocktails.add);
    getLocal().then(_userCocktails.add);
  }

  Stream<List<UiCocktail>> get hostCocktails => _hostCocktails;

  Stream<List<UiCocktail>> get userCocktails => _hostCocktails;

  Future<List<UiCocktail>> getCocktails() async {
    final list = await _source.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }

  Future<List<UiCocktail>> getLocal() async {
    final list = await _local.getCocktails();
    final cocktails = list.map(UiCocktail.fromApi).toList();
    return cocktails;
  }

  Future<void> saveCocktail(UiCocktail cocktail) async {
    final api = cocktail.toApi();
    await _local.saveCocktail(api);
    await _source.postCocktail(api);
  }

  Future<void> deleteCocktail(UiCocktail cocktail) async {
    final api = cocktail.toApi();
    await _local.deleteCocktail(api);
  }
}
