import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsInitial());

  double liters = 0;
  Map<String, int> cocktailsCounts = {
    'Аллах Бабах': 42,
    'Русская рулетка': 35,
    'Б-52': 27,
  };
  Map<String, int> cocktailsDays = {'Отчисленный Богдан': 5};

  void init() {
    updateValues();
  }

  void updateValues() {
    emit(StatsValues(
      liters: liters,
      cocktailsCounts: cocktailsCounts,
      cocktailsDays: cocktailsDays,
    ));
  }
}
