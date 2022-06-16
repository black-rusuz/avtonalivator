import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../cubit/connect/connect_cubit.dart';
import '../../../cubit/scan/scan_cubit.dart';
import 'scan_device_list_item.dart';

class ScanDeviceList extends StatelessWidget {
  final List<BluetoothDevice> devices;
  final bool directly;

  const ScanDeviceList({
    Key? key,
    required this.devices,
    this.directly = false,
  }) : super(key: key);

  void connect(BuildContext context, String? name, String address) => directly
      ? context.read<ConnectCubit>().connect(name, address)
      : context.read<ScanCubit>().connect(name, address);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: devices
          .map((e) => ScanDeviceListItem(
                device: e,
                onTap: () => connect(context, e.name, e.address),
              ))
          .toList(),
    );
  }
}
