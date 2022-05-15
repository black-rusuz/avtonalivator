import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final void Function()? onTap;

  const DeviceListItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Center(child: Icon(Icons.device_unknown), widthFactor: 1),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.connect_without_contact),
    );
  }
}
