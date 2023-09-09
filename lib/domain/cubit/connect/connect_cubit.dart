import 'dart:async';
import 'dart:convert';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../model/pump_model.dart';

part 'connect_state.dart';

class ConnectArgs {
  final BluetoothConnection connection;
  final String name;
  final String address;

  ConnectArgs({
    required this.connection,
    required this.name,
    required this.address,
  });
}

class ConnectCubit extends Cubit<ConnectState> {
  ConnectArgs? args;

  ConnectCubit([this.args]) : super(ConnectInitial());

  bool get isConnected => args != null;

  final String refreshCommand = 'y1';
  final String pourCommand = 'z1';
  final String pumpAirCommand = 'a15 b15 c15 d15 e15 d15 y1 z1';

  void init() {
    if (isConnected) {
      emit(ConnectConnected(name: args!.name, address: args!.address));
    }
  }

  void sendRefresh(PumpModel pump) async {
    int value = pump.isEnabled ? pump.volume.round() : 0;
    String command = pump.letter + value.toString();
    await sendCommand(command);
    EasyDebounce.debounce(
      '_',
      const Duration(milliseconds: 100),
      () async => await sendCommand(refreshCommand),
    );
  }

  void sendPour() async {
    // TODO: анимация налива
    await sendCommand(pourCommand);
  }

  void sendPumpAir() async {
    // TODO: анимация прокачки
    await sendCommand(pumpAirCommand);
  }

  Future sendCommand(String command) async {
    if (kDebugMode) print(command);
    command = '${command.trim()}\r';
    List<int> encodedChars = utf8.encode(command);
    Uint8List output = Uint8List.fromList(encodedChars);
    args?.connection.output.add(output);
    return await args?.connection.output.allSent;
  }

  void connect(String? name, String address) async {
    emit(ConnectConnecting());
    await args?.connection.close();
    BluetoothConnection.toAddress(address).then((attempt) {
      if (attempt.isConnected) {
        args = ConnectArgs(
          connection: attempt,
          name: name ?? '',
          address: address,
        );
        emit(ConnectConnected(name: name ?? '', address: address));
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
    await args?.connection.finish();
    args = null;
    emit(ConnectInitial());
  }

  @override
  Future<void> close() async {
    await args?.connection.finish();
    EasyDebounce.cancelAll();
    return super.close();
  }
}
