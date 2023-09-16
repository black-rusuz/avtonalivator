import '../../data/model/cocktail.dart';

abstract interface class CocktailsSource {
  Future<List<ApiCocktail>> getCocktails();
}
