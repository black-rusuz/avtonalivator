import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cocktail_model.dart';
import '../../repository/repository.dart';
import '../../repository/repository_local.dart';

part 'cocktails_state.dart';

class CocktailsCubit extends Cubit<CocktailsState> {
  CocktailsCubit() : super(const CocktailsInitial());

  final Repository repository = RepositoryLocal();
  List<CocktailModel> cocktails = [];
  StreamSubscription<List<CocktailModel>>? cocktailsSubscription;

  void init() {
    getCocktails();
  }

  void getCocktails() {
    cocktailsSubscription = repository.getCocktails().asStream().listen((v) {
      cocktails = v;
      emit(CocktailsFetched(cocktails: cocktails));
    });
  }

  @override
  Future<void> close() async {
    await cocktailsSubscription?.cancel();
    return super.close();
  }
}
