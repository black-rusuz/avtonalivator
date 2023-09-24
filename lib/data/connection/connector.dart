import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

import 'input_transformer.dart';

const _start = '\$ves';

@singleton
class Connector {
  final _bluetooth = FlutterBluetoothSerial.instance;
  final _input = StreamController<Uint8List>.broadcast();

  Connector();

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
    } catch (_) {
      // TODO: log
    }
    return _connection;
  }

  Future<void> sendCommand(String command) async {
    if (kDebugMode) print(command);
    command = '$command\r';

    final encodedChars = utf8.encode(command);
    final output = Uint8List.fromList(encodedChars);

    _connection?.output.add(output);
    return await _connection?.output.allSent;
  }

  Stream<String> get input => _input.stream
      .expand((list) => list.map((byte) => byte))
      .transform(InputTransformer())
      .distinct()
      .map(utf8.decode)
      .where((s) => s.startsWith(_start) && s.length == 80);

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
