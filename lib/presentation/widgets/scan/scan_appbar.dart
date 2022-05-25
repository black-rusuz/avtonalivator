import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

import 'app_bar_card.dart';

class ScanAppBar extends StatelessWidget {
  const ScanAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text('Подключение', style: Style.pageTitle),
      pinned: true,
      collapsedHeight: 60,
      expandedHeight: 260,
      flexibleSpace: const FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(child: AppBarCard()),
        ),
      ),
    );
  }
}
