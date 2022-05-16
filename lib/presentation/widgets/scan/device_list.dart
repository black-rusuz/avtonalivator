import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'devices_list_item.dart';

class DeviceList extends StatelessWidget {
  final List<BluetoothDevice> devices;

  const DeviceList({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        devices.map((e) => DeviceListItem(device: e)).toList(),
      ),
    );
  }
}
