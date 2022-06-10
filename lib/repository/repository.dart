import '../model/cocktail_model.dart';

abstract class Repository {
  Future<List<CocktailModel>> getCocktails();
}
