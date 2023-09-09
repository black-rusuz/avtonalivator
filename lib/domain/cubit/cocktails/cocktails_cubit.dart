import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/repository.dart';
import '../../../domain/repository/repository_local.dart';
import '../../../model/cocktail_model.dart';

part 'cocktails_state.dart';

class CocktailsCubit extends Cubit<CocktailsState> {
  final Repository repository = RepositoryLocal();

  CocktailsCubit() : super(const CocktailsInitial());

  bool filtered = false;
  List<CocktailModel> cocktails = [];

  StreamSubscription<List<CocktailModel>>? cocktailsSubscription;

  List<String> get ingredients =>
      cocktails.map((e) => e.ingredients).expand((e) => e).toSet().toList();

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
    List<CocktailModel> cocktails = this
        .cocktails
        .where((e) => e.name.toLowerCase().startsWith(name.toLowerCase()))
        .toList();
    emit(CocktailsFetched(cocktails: cocktails, filtered: filtered));
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
    List<CocktailModel> cocktails =
        this.cocktails.where((cocktail) => cocktail.contains(drinks)).toList();
    return cocktails;
  }

  @override
  Future<void> close() async {
    await cocktailsSubscription?.cancel();
    return super.close();
  }
}
