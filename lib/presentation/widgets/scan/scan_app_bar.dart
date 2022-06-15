import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

import 'scan_app_bar_card.dart';

class ScanAppBar extends StatelessWidget {
  final bool isDiscovering;
  final bool isConnecting;

  const ScanAppBar({
    Key? key,
    this.isDiscovering = false,
    this.isConnecting = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      collapsedHeight: 60,
      expandedHeight: 260,
      title: Text('Подключение', style: Style.pageTitle),
      actions: [
        if (isConnecting)
          Center(
            child: Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.all(12),
              child: const CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 3,
              ),
            ),
          ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: ScanAppBarCard(
            margin: const EdgeInsets.only(top: 50),
            isConnecting: isConnecting,
          ),
        ),
      ),
    );
  }
}
