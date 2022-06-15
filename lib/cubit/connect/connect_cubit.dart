import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../model/pump_model.dart';

part 'connect_state.dart';

class ConnectCubit extends Cubit<ConnectState> {
  BluetoothConnection? connection;

  ConnectCubit([this.connection]) : super(ConnectInitial());

  bool get isConnected => connection != null;

  final String _debouncer = 'refresher';

  final String _refreshCommand = 'y1';
  final String _pourCommand = 'z1';

  void init() {
    if (isConnected) emit(ConnectSuccess(name: 'name', address: 'address'));
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

  Future<void> sendPour() async {
    // TODO: анимация налива
    await sendCommand(_pourCommand);
  }

  Future<void> sendCommand(String command) async {
    // TODO: print
    print(command);
    command = command.trim() + '\r';
    List<int> encodedChars = utf8.encode(command);
    Uint8List output = Uint8List.fromList(encodedChars);
    connection?.output.add(output);
    await connection?.output.allSent;
  }

  Future<void> connect(String address) async {
    await connection?.close();
    BluetoothConnection.toAddress(address).then((v) {
      if (v.isConnected) {
        connection = v;
        emit(ConnectSuccess(name: 'a', address: address));
      }
      //TODO: ошибка подключения
    });
  }

  Future<void> disconnect() async {
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
