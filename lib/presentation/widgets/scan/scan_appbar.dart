import 'package:flutter/material.dart';

class ScanAppBar extends StatelessWidget {
  const ScanAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text('Подключение'),
      pinned: true,
      collapsedHeight: 60,
      expandedHeight: 360,
      centerTitle: true,
    );
  }
}
