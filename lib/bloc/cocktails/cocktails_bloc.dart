import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cocktail_model.dart';
import '../../repository/repository.dart';
import '../../repository/repository_local.dart';

part 'cocktails_event.dart';
part 'cocktails_state.dart';

class CocktailsBloc extends Bloc<CocktailsEvent, CocktailsState> {
  CocktailsBloc() : super(CocktailsInitialState()) {
    on<CocktailsInitEvent>(_init);
  }

  final Repository _repository = RepositoryLocal();

  List<CocktailModel> _cocktails = [];

  FutureOr<void> _init(CocktailsInitEvent event, Emitter<CocktailsState> emit) {
    _cocktails = _repository.cocktails;
    emit(CocktailsFetchedState(cocktails: _cocktails));
  }
}
