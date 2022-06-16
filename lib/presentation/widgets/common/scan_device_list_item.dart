import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../common/base_divider.dart';

class ScanDeviceListItem extends StatelessWidget {
  final BluetoothDevice device;
  final void Function() onTap;

  const ScanDeviceListItem({
    Key? key,
    required this.device,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Material(
        color: Style.yellowAccent,
        child: Column(
          children: [
            const BaseDivider(indent: 0),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 2),
              onTap: onTap,
              title: Text(device.name ?? device.address),
              trailing: const Icon(Icons.bluetooth),
            ),
            const BaseDivider(indent: 0),
          ],
        ),
      ),
    );
  }
}
