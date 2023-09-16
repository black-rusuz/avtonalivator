part of 'tuning_bloc.dart';

abstract class TuningEvent {
  const TuningEvent();
}
class TuningInit extends TuningEvent {
  const TuningInit();
}

class TuningFetched extends TuningEvent {
  const TuningFetched();
}

class SetPump extends TuningEvent {
  final UiPump pump;

  SetPump(this.pump);
}
