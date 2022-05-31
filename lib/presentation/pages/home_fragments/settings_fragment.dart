import 'package:flutter/material.dart';

import '../../widgets/common/base_app_bar.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Настройки'),
        SliverToBoxAdapter(
          child: Container(
            height: 1000,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
