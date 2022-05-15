import 'package:avtonalivator/bloc/launch/launch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceListItem extends StatelessWidget {
  final String title;
  final String? subtitle;

  const DeviceListItem({Key? key, required this.title, this.subtitle})
      : super(key: key);

  // TODO: Коннект
  void connect(BuildContext context) => context.read<LaunchBloc>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => connect(context),
      leading: const Center(child: Icon(Icons.device_unknown), widthFactor: 1),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.connect_without_contact),
    );
  }
}
