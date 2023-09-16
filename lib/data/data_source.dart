import 'package:injectable/injectable.dart';

import 'model/cocktail.dart';
import 'model/config.dart';

@injectable
class DataSource {
  final _http;

  DataSource(this._http);

  Future<List<ApiCocktail>> getCocktails() {
    // TODO: implement getCocktails
    throw UnimplementedError();
  }

  Future<ApiConfig> getConfig() {
    // TODO: implement getConfig
    throw UnimplementedError();
  }
}
