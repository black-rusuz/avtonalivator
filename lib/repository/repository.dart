import '../model/cocktail_model.dart';

abstract class Repository {
  List<CocktailModel> get cocktails;
}
