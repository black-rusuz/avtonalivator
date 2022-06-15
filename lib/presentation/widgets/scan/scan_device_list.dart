import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'scan_device_list_item.dart';

class ScanDeviceList extends StatelessWidget {
  final List<BluetoothDevice> devices;

  const ScanDeviceList({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: devices.map((e) => ScanDeviceListItem(device: e)).toList(),
    );
  }
}
