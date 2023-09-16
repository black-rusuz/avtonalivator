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
