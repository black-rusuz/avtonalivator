import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

import 'input_transformer.dart';

/// Прослойка для библиотеки flutter_bluetooth_serial
@singleton
class FbsAdapter {
  final _bluetooth = FlutterBluetoothSerial.instance;
  final _input = StreamController<Uint8List>.broadcast();

  FbsAdapter();

  BluetoothConnection? _connection;
  BluetoothDevice? device;

  // * Public

  Future<bool> get isDiscovering async {
    final value = await _bluetooth.isDiscovering ?? false;
    return value;
  }

  Stream<BluetoothDevice> get devices async* {
    await _bluetooth.cancelDiscovery();
    final scanResultStream = _bluetooth.startDiscovery();

    await for (final result in scanResultStream) {
      yield result.device;
    }
  }

  Future<void> cancelDiscovery() {
    return _bluetooth.cancelDiscovery();
  }

  Future<BluetoothConnection?> connect(BluetoothDevice device) async {
    try {
      await _connect(device.address);
      this.device = device;
      await _setupStream();
    } catch (e) {
      // TODO: log
    }
    return _connection;
  }

  Future<void> send(Uint8List bytes) async {
    try {
      _connection?.output.add(bytes);
      await _connection?.output.allSent;
    } catch (e) {
      // TODO: log
    }
  }

  Stream<Uint8List> get input => _input.stream
      .expand((list) => list)
      .transform(InputTransformer());

  Future<void> disconnect() async {
    await _connection?.close();
    device = null;
  }

  // * Private

  Future<BluetoothConnection?> _connect(String address) async {
    await disconnect();

    final attempt = await BluetoothConnection.toAddress(address);
    if (attempt.isConnected) _connection = attempt;

    return _connection;
  }

  Future<void> _setupStream() async {
    if (_connection?.input == null) return;
    final stream = _connection!.input!;
    _input.addStream(stream);
  }
}
