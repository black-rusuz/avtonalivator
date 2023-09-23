import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/device.dart';
import 'device_card.dart';

class DeviceList extends StatelessWidget {
  final double minHeight;
  final List<UiDevice> devices;
  final ValueChanged<UiDevice> onItemTap;

  const DeviceList({
    super.key,
    required this.minHeight,
    required this.devices,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Ink(
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.vertical(top: AppTheme.radius),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: AppTheme.listPadding,
          itemCount: devices.length,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final device = devices[index];
    return DeviceCard(
      title: device.name ?? device.address,
      subtitle: device.address,
      onTap: () => onItemTap(device),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
