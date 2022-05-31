import 'package:flutter/material.dart';

import '../../widgets/common/base_app_bar.dart';
import '../../widgets/common/sliver_widget_list.dart';
import '../../widgets/tuning_card.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BaseAppBar(title: 'Регулировка'),
        SliverWidgetList(
          children: [
            TuningCard(position: 1),
            TuningCard(position: 2),
            TuningCard(position: 3),
            TuningCard(position: 4),
            TuningCard(position: 5),
            TuningCard(position: 6),
          ],
        )
      ],
    );
  }
}
