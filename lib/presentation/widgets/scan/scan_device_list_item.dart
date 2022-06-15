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
    return Column(
      children: [
        const BaseDivider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 30,
          ),
          onTap: onTap,
          //leading: const Icon(Icons.device_unknown),
          title: Text(device.name ?? device.address),
          //subtitle: Text(device.address),
          trailing: const Icon(Icons.bluetooth),
        ),
        const BaseDivider(),
      ],
    );
  }
}
