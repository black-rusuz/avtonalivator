import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

import '../../model/pump_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitEvent>(_init);
    on<HomeConnectEvent>(_connect);
    on<HomeSetPumpEvent>(_setPump);
    on<HomePourEvent>(_sendPour);
  }

  BluetoothConnection? _connection;

  bool get isConnected => _connection != null;

  final PumpModel _pump = const PumpModel(
    id: 0,
    name: 'Напиток',
    volume: 25,
    isEnabled: true,
  );

  late PumpModel _pumpA;
  late PumpModel _pumpB;
  late PumpModel _pumpC;
  late PumpModel _pumpD;
  late PumpModel _pumpE;
  late PumpModel _pumpF;

  List<PumpModel> get _allPumps => [
        _pumpA,
        _pumpB,
        _pumpC,
        _pumpD,
        _pumpE,
        _pumpF,
      ];

  final String _refreshCommand = 'y1';

  final String _pourCommand = 'z1';

  FutureOr<void> _sendRefresh(PumpModel pump) async {
    String command = [
      pump.letter + pump.volume.round().toString(),
      _refreshCommand,
    ].join(' ');
    await _sendCommand(command);
  }

  FutureOr<void> _sendCommand(String command) async {
    // TODO: print
    print(command);
    command = command.trim() + '\r';
    List<int> encodedChars = utf8.encode(command);
    Uint8List output = Uint8List.fromList(encodedChars);
    _connection?.output.add(output);
    await _connection?.output.allSent;
  }

  FutureOr<void> _init(HomeInitEvent event, Emitter<HomeState> emit) {
    _pumpA = _pump.copyWith(id: 1);
    _pumpB = _pump.copyWith(id: 2);
    _pumpC = _pump.copyWith(id: 3);
    _pumpD = _pump.copyWith(id: 4);
    _pumpE = _pump.copyWith(id: 5, isEnabled: false);
    _pumpF = _pump.copyWith(id: 6, isEnabled: false);
    emit(HomeAllPumpsState(pumps: _allPumps));
  }

  FutureOr<void> _connect(HomeConnectEvent event, Emitter<HomeState> emit) {
    _connection = event.connection;
    emit(HomeConnectedState());
  }

  FutureOr<void> _setPump(
    HomeSetPumpEvent event,
    Emitter<HomeState> emit,
  ) async {
    switch (event.pump.id) {
      case (1):
        _pumpA = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (2):
        _pumpB = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (3):
        _pumpC = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (4):
        _pumpD = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (5):
        _pumpE = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
      case (6):
        _pumpF = event.pump;
        emit(HomePumpDefinedState(pump: event.pump));
        break;
    }
    await _sendRefresh(event.pump);
  }

  FutureOr<void> _sendPour(HomePourEvent event, Emitter<HomeState> emit) async {
    // TODO: мб блочить кнопку
    await _sendCommand(_pourCommand);
  }

  @override
  Future<void> close() async {
    await _connection?.finish();
    return super.close();
  }
}
