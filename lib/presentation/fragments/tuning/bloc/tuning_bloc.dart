import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/pump.dart';
import '../../../../domain/storage/settings.dart';

part 'tuning_event.dart';
part 'tuning_state.dart';

@injectable
class TuningBloc extends Bloc<TuningEvent, TuningState> {
  final SettingsBox _settings;

  TuningBloc(this._settings) : super(TuningInitial()) {
    on<TuningFetched>(_emitFulfilled);
    on<SetPump>(_setPump);
    _init();
  }

  List<UiPump> pumps = [];

  // * Init

  void _init() {
    final quantity = _settings.pumpsQuantity;
    pumps = List.generate(
      quantity,
      (index) => UiPump.base.copyWith(id: ++index),
    );
    _addFetched();
  }

  void _addFetched() {
    add(const TuningFetched());
  }

  // * Handlers

  void _emitFulfilled(TuningFetched event, Emitter<TuningState> emit) {
    emit(TuningFulfilled(pumps: pumps));
  }

  void _setPump(SetPump event, Emitter<TuningState> emit) {
    final pump = event.pump;
    pumps.update(pump);
    _addFetched();
  }
}

extension _Update<T> on List<T> {
  void update(T element) {
    if (contains(element)) {
      final index = indexOf(element);
      this[index] = element;
    }
  }
}
