import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cocktail_model.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsInitial());

  final Map<CocktailModel, int> cocktailsCounts = {
    const CocktailModel(id: 1, name: 'Аллах Бабах'): 42,
    const CocktailModel(id: 1, name: 'Русская рулетка'): 35,
    const CocktailModel(id: 1, name: 'Б-52'): 27,
  };

  final Map<CocktailModel, int> cocktailsDays = {
    const CocktailModel(id: 1, name: 'Отчисленный Богдан'): 5
  };

  void init() {
    emit(StatsValues(
      liters: 372,
      cocktailsCounts: cocktailsCounts,
      cocktailsDays: cocktailsDays,
    ));
  }
}
