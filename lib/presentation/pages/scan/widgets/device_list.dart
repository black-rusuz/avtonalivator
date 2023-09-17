import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../../core/theme.dart';
import '../../../widgets/basic_card.dart';

class DeviceList extends StatelessWidget {
  final List<BluetoothDevice> devices;
  final ValueChanged<BluetoothDevice> onItemTap;

  const DeviceList({
    super.key,
    required this.devices,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.vertical(top: AppTheme.radius),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        itemCount: devices.length,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = devices[index];
    return _DeviceCard(
      title: item.name ?? item.address,
      subtitle: item.address,
      onTap: () => onItemTap(item),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}

class _DeviceCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const _DeviceCard({
    required this.title,
    this.subtitle,
    this.onTap,
  });

  bool get singleLine => subtitle?.isNotEmpty != true;

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      onTap: onTap,
      color: AppTheme.background,
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 46,
        child: Row(
          children: [
            Expanded(
              child: singleLine
                  ? Text(title)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: AppTheme.text,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle!,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: AppTheme.textLight.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
            ),
            const SizedBox(width: 16),
            const Icon(CupertinoIcons.bluetooth)
          ],
        ),
      ),
    );
  }
}
