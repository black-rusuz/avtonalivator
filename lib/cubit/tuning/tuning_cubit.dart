import 'package:bloc/bloc.dart';

import '../../model/pump_model.dart';

part 'tuning_state.dart';

class TuningCubit extends Cubit<TuningState> {
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

  void init() {
    allPumps.forEach(emitPump);
  }

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

  void emitPump(PumpModel pump) => emit(TuningSoloPump(pump: pump));
}
