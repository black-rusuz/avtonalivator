import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/pump.dart';
import '../../../../domain/repository/config_repository.dart';

part 'tuning_event.dart';
part 'tuning_state.dart';

@injectable
class TuningBloc extends Bloc<TuningEvent, TuningState> {
  final ConfigRepository _config;

  TuningBloc(this._config) : super(TuningInitial()) {
    on<TuningFetched>(_emitFulfilled);
    _init();
  }

  List<UiPump> pumps = [];

  // * Init

  void _init() {
    final quantity = _config.value.drinksQuantity;
    pumps = List.generate(quantity, (index) => UiPump.base.copyWith(id: index));
    _addFetched();
  }

  void _addFetched() {
    add(const TuningFetched());
  }

  // * Handlers

  void _emitFulfilled(TuningFetched event, Emitter<TuningState> emit) {
    emit(TuningFulfilled(pumps: pumps));
  }
}
