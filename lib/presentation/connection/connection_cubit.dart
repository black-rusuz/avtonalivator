import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/connector.dart';
import '../../domain/model/device.dart';

part 'connection_state.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final Connector _connector;

  ConnectionCubit(this._connector) : super(ConnectionInitial());

  BluetoothConnection? get connection => _connector.connection;

  UiDevice? get device =>
      _connector.device == null ? null : UiDevice.fromLib(_connector.device!);

  void disconnect() {
    _connector.disconnect();
  }
}
