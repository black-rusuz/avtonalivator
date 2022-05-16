import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../bloc/scan/scan_bloc.dart';

class DeviceListItem extends StatelessWidget {
  final BluetoothDevice device;

  const DeviceListItem({Key? key, required this.device}) : super(key: key);

  void connectToDevice(BuildContext context, String address) =>
      context.read<ScanBloc>().add(ScanDevicePickedEvent(address: address));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => connectToDevice(context, device.address),
      leading: const Icon(Icons.device_unknown),
      // TODO: Массив животных
      title: Text(device.name ?? "Неопознанный "),
      //subtitle: Text(device.address),
      trailing: const Icon(Icons.connect_without_contact),
    );
  }
}
