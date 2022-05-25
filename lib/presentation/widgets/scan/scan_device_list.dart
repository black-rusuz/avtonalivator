import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'scan_device_list_item.dart';

class ScanDeviceList extends StatelessWidget {
  final List<BluetoothDevice> devices;

  const ScanDeviceList({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: Style.yellowAccent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children:
              // TODO: убрать
              devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList() +
                  devices.map((e) => ScanDeviceListItem(device: e)).toList(),
        ),
      ),
    );
  }
}
