import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstore/localstore.dart';

import '../../../constants.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  final db = Localstore.instance;

  StatsCubit() : super(StatsInitial());

  double liters = 0;
  Map<String, int> cocktailsCounts = {};
  Map<String, int> cocktailsDays = {};

  void init() {
    updateValues();
  }

  void updateValues() async {
    await getValues();
    emit(StatsValues(
      liters: liters,
      cocktailsCounts: cocktailsCounts,
      cocktailsDays: cocktailsDays,
    ));
  }

  Future<void> getValues() async {
    liters = (await db
            .collection(Constants.collection)
            .doc(Constants.liters)
            .get())?[Constants.liters] ??
        0;
    Map<String, dynamic>? counts = await db
            .collection(Constants.collection)
            .doc(Constants.favourite)
            .get() ??
        cocktailsCounts;
    cocktailsCounts = counts as Map<String, int>;
    Map<String, dynamic>? last =
        await db.collection(Constants.collection).doc(Constants.last).get() ??
            cocktailsDays;
    cocktailsDays = last as Map<String, int>;
  }
}
