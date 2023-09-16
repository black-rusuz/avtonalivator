import 'package:injectable/injectable.dart';

import '../../domain/datasource/cocktails_source.dart';
import '../model/cocktail.dart';

@Injectable(as: CocktailsSource)
class ApiCocktailsSource implements CocktailsSource {
  final _http;

  ApiCocktailsSource(this._http);

  @override
  Future<List<ApiCocktail>> getCocktails() {
    // TODO: implement getCocktails
    throw UnimplementedError();
  }
}
