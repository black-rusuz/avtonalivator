import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:injectable/injectable.dart';

@singleton
class Connector {
  final _bluetooth = FlutterBluetoothSerial.instance;

  Connector();

  BluetoothConnection? connection;

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
    } catch (_) {
      // TODO: log
    }
    return connection;
  }

  Future<void> disconnect() async {
    await connection?.close();
  }

  Future<BluetoothConnection?> _connect(String address) async {
    await disconnect();

    final attempt = await BluetoothConnection.toAddress(address);
    if (attempt.isConnected) connection = attempt;

    return connection;
  }
}
