import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

@singleton
class Connector {
  final _bluetooth = FlutterBluetoothSerial.instance;

  Connector();

  BluetoothConnection? _connection;
  BluetoothDevice? device;

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

  Stream<String> get input {
    if (_connection?.input == null) {
      return const Stream.empty();
    } else {
      return _connection!.input!
          .map(_utfTransformer)
          .takeWhile(_stringCollector)
          .asBroadcastStream();
    }
  }

  Future<void> disconnect() async {
    await _connection?.close();
    device = null;
  }

  Future<BluetoothConnection?> _connect(String address) async {
    await disconnect();

    final attempt = await BluetoothConnection.toAddress(address);
    if (attempt.isConnected) _connection = attempt;

    return _connection;
  }
}

String _utfTransformer(Uint8List event) {
  print(event);
  final decoded = utf8.decode(event);
  print(decoded);
  return decoded;
}

bool _stringCollector(String element) {
  return true;
}
