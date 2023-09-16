import 'package:flutter/material.dart';

import '../../../../core/theme.dart';

class DeviceList extends StatelessWidget {
  final List items;
  final ValueChanged onItemTap;

  const DeviceList({
    super.key,
    required this.items,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: AppTheme.white,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Container(
      color: AppTheme.white,
      height: 50,
      width: 200,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
