import 'package:flutter/material.dart';

import '../../widgets/common/base_app_bar.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Статистика'),
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
