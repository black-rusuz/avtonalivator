import 'package:flutter/material.dart';

import 'devices_list_item.dart';

class DeviceList extends StatelessWidget {
  final List devices;

  const DeviceList({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        devices.map((e) => DeviceListItem(title: e)).toList(),
      ),
    );
  }
}
