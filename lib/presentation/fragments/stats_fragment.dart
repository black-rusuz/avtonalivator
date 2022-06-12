import 'package:flutter/material.dart';

import '../widgets/common/base_app_bar.dart';
import '../widgets/common/sliver_widget_list.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BaseAppBar(title: 'Статистика'),
        SliverWidgetList(children: []),
      ],
    );
  }
}
