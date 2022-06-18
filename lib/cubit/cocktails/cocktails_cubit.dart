import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cocktail_model.dart';
import '../../repository/repository.dart';
import '../../repository/repository_local.dart';

part 'cocktails_state.dart';

class CocktailsCubit extends Cubit<CocktailsState> {
  final Repository repository = RepositoryLocal();

  CocktailsCubit() : super(const CocktailsInitial());

  bool filtered = false;
  List<CocktailModel> cocktails = [];

  StreamSubscription<List<CocktailModel>>? cocktailsSubscription;

  List<String> get ingredients => cocktails
      .map((e) => e.ingredients)
      .expand((e) => e)
      .toSet()
      .toList();

  void init() {
    getCocktails();
  }

  void getCocktails() {
    cocktailsSubscription = repository.getCocktails().asStream().listen((v) {
      cocktails = v;
      emit(CocktailsFetched(cocktails: cocktails));
    });
  }

  void search(String name) {
    List<CocktailModel> _cocktails = cocktails
        .where((e) => e.name.toLowerCase().startsWith(name.toLowerCase()))
        .toList();
    emit(CocktailsFetched(cocktails: _cocktails, filtered: filtered));
  }

  void setFilter(bool value, List<String> drinks) {
    filtered = value;
    if (filtered) {
      emit(CocktailsFetched(
        cocktails: filterCocktails(drinks),
        filtered: filtered,
      ));
    } else {
      emit(CocktailsFetched(cocktails: cocktails, filtered: filtered));
    }
  }

  List<CocktailModel> filterCocktails(List<String> drinks) {
    List<CocktailModel> _cocktails =
        cocktails.where((cocktail) => cocktail.contains(drinks)).toList();
    return _cocktails;
  }

  @override
  Future<void> close() async {
    await cocktailsSubscription?.cancel();
    return super.close();
  }
}
