import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'device.g.dart';

@HiveType(typeId: 1)
class UiDevice extends Equatable {
  @HiveField(0)
  final String? name;

  @HiveField(1)
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
