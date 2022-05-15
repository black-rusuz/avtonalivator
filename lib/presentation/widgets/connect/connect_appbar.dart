import 'package:flutter/material.dart';

class ConnectAppBar extends StatelessWidget {
  const ConnectAppBar({Key? key}) : super(key: key);

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
