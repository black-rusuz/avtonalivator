import 'package:avtonalivator/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:localstore/localstore.dart';

import '../../model/pump_model.dart';

part 'tuning_state.dart';

class TuningCubit extends Cubit<TuningState> {
  final db = Localstore.instance;

  TuningCubit() : super(TuningInitial());

  PumpModel pumpA = PumpModel.base.copyWith(id: 1);
  PumpModel pumpB = PumpModel.base.copyWith(id: 2);
  PumpModel pumpC = PumpModel.base.copyWith(id: 3);
  PumpModel pumpD = PumpModel.base.copyWith(id: 4);
  PumpModel pumpE = PumpModel.base.copyWith(id: 5, isEnabled: false);
  PumpModel pumpF = PumpModel.base.copyWith(id: 6, isEnabled: false);

  List<PumpModel> get allPumps => [
        pumpA,
        pumpB,
        pumpC,
        pumpD,
        pumpE,
        pumpF,
      ];

  List<String> get drinks => allPumps.map((e) => e.name).toList();

  List<String> get drinksEnabled =>
      allPumps.expand((e) => [if (e.isEnabled) e.name]).toList();

  void init() {}

  void setPump(PumpModel pump) {
    switch (pump.id) {
      case (1):
        if (pumpA != pump) {
          pumpA = pump;
          emitPump(pump);
        }
        break;
      case (2):
        if (pumpB != pump) {
          pumpB = pump;
          emitPump(pump);
        }
        break;
      case (3):
        if (pumpC != pump) {
          pumpC = pump;
          emitPump(pump);
        }
        break;
      case (4):
        if (pumpD != pump) {
          pumpD = pump;
          emitPump(pump);
        }
        break;
      case (5):
        if (pumpE != pump) {
          pumpE = pump;
          emitPump(pump);
        }
        break;
      case (6):
        if (pumpF != pump) {
          pumpF = pump;
          emitPump(pump);
        }
        break;
    }
  }

  void saveStats() async {
    int milliliters = 0;
    for (var e in allPumps) {
      if (e.isEnabled) milliliters += e.volume.floor();
    }

    Map<String, dynamic>? map =
        await db.collection(Constants.collection).doc(Constants.liters).get();
    double liters = (map?[Constants.liters] ?? 0).toDouble();
    liters = liters + milliliters * 0.001;
    db
        .collection(Constants.collection)
        .doc(Constants.liters)
        .set({Constants.liters: liters});
  }

  void emitPump(PumpModel pump) => emit(TuningPump(pump: pump));
}
