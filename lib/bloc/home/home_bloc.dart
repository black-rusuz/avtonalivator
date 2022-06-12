import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../model/pump_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitEvent>(_init);
    on<HomeSetPumpEvent>(_setPump);
  }

  final PumpModel _pump = const PumpModel(
    id: 0,
    name: 'Напиток',
    volume: 25,
    isEnabled: true,
  );

  PumpModel? _pumpA;
  PumpModel? _pumpB;
  PumpModel? _pumpC;
  PumpModel? _pumpD;
  PumpModel? _pumpE;
  PumpModel? _pumpF;

  List<PumpModel> get _allPumps => [
        _pumpA!,
        _pumpB!,
        _pumpC!,
        _pumpD!,
        _pumpE!,
        _pumpF!,
      ];

  FutureOr<void> _init(HomeInitEvent event, Emitter<HomeState> emit) {
    _pumpA = _pumpA ?? _pump.copyWith(id: 1);
    _pumpB = _pumpB ?? _pump.copyWith(id: 2);
    _pumpC = _pumpC ?? _pump.copyWith(id: 3);
    _pumpD = _pumpD ?? _pump.copyWith(id: 4);
    _pumpE = _pumpE ?? _pump.copyWith(id: 5, isEnabled: false);
    _pumpF = _pumpF ?? _pump.copyWith(id: 6, isEnabled: false);
    emit(HomeAllPumpsState(pumps: _allPumps));
  }

  FutureOr<void> _setPump(
    HomeSetPumpEvent event,
    Emitter<HomeState> emit,
  ) async {
    switch (event.pump.id) {
      case (1):
        if (_pumpA == event.pump) break;
        _pumpA = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (2):
        if (_pumpB == event.pump) break;
        _pumpB = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (3):
        if (_pumpC == event.pump) break;
        _pumpC = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (4):
        if (_pumpD == event.pump) break;
        _pumpD = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (5):
        if (_pumpE == event.pump) break;
        _pumpE = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (6):
        if (_pumpF == event.pump) break;
        _pumpF = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
    }
  }

  @override
  Future<void> close() async {
    EasyDebounce.cancel(_pump.name);
    return super.close();
  }
}
