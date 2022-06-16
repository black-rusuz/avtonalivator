import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../model/pump_model.dart';

part 'connect_state.dart';

class ConnectCubit extends Cubit<ConnectState> {
  BluetoothConnection? connection;
  String? name;
  String? address;

  ConnectCubit([
    this.connection,
    this.name,
    this.address,
  ]) : super(ConnectInitial());

  bool get isConnected => connection != null;

  final String _debouncer = 'refresher';

  final String _refreshCommand = 'y1';
  final String _pourCommand = 'z1';

  void init() {
    if (isConnected) {
      emit(ConnectConnected(name: name ?? '', address: address ?? ''));
    }
  }

  void sendRefresh(PumpModel pump) {
    String command = [
      pump.letter + (pump.isEnabled ? pump.volume.round().toString() : '0'),
      _refreshCommand,
    ].join(' ');
    EasyDebounce.debounce(
      _debouncer,
      const Duration(milliseconds: 100),
      () async => await sendCommand(command),
    );
  }

  void sendPour() async {
    // TODO: анимация налива
    await sendCommand(_pourCommand);
  }

  Future<void> sendCommand(String command) async {
    if (kDebugMode) print(command);
    command = command.trim() + '\r';
    List<int> encodedChars = utf8.encode(command);
    Uint8List output = Uint8List.fromList(encodedChars);
    connection?.output.add(output);
    return await connection?.output.allSent;
  }

  void connect(String name, String address) async {
    emit(ConnectConnecting());
    await connection?.close();
    BluetoothConnection.toAddress(address).then((attempt) {
      if (attempt.isConnected) {
        connection = attempt;
        emit(ConnectConnected(name: name, address: address));
      } else {
        // TODO: ошибка
        emit(ConnectInitial());
      }
    }).onError((error, stackTrace) {
      // TODO: ошибка
      emit(ConnectInitial());
    });
  }

  void disconnect() async {
    await connection?.finish();
    connection = null;
    emit(ConnectInitial());
  }

  @override
  Future<void> close() async {
    await connection?.finish();
    EasyDebounce.cancel(_debouncer);
    return super.close();
  }
}
