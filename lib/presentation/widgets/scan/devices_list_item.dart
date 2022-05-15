import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/scan/scan_bloc.dart';

class DeviceListItem extends StatelessWidget {
  final String title;
  final String? subtitle;

  const DeviceListItem({Key? key, required this.title, this.subtitle})
      : super(key: key);

  // TODO: Коннект
  void scan(BuildContext context) => context.read<ScanBloc>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => scan(context),
      leading: const Icon(Icons.device_unknown),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.connect_without_contact),
    );
  }
}
