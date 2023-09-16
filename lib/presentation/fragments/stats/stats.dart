import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../strings.dart';
import '../../widgets/basic_card.dart';
import '../../widgets/basic_sliver_bar.dart';
import 'widgets/counter.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BasicSliverBar(
          title: Text(Strings.stats, style: AppTheme.pageTitle),
          child: Center(
            child: StatsCounter(liters: 0.92),
          ),
        ),
        SliverToBoxAdapter(
          child: Ink(
            decoration: const BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.vertical(top: AppTheme.radius),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              itemCount: 20,
              itemBuilder: itemBuilder,
              separatorBuilder: separatorBuilder,
            ),
          ),
        ),
      ],
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return const BasicCard(
      padding: EdgeInsets.all(20),
      color: AppTheme.white,
      child: Text('Card'),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
