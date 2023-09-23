import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class UiDevice extends Equatable {
  final String? name;
  final String address;

  const UiDevice({
    required this.name,
    required this.address,
  });

  factory UiDevice.fromLib(BluetoothDevice device) {
    return UiDevice(
      name: device.name,
      address: device.address,
    );
  }

  BluetoothDevice toLib() {
    return BluetoothDevice(
      name: name,
      address: address,
    );
  }

  @override
  List<Object?> get props => [];
}
