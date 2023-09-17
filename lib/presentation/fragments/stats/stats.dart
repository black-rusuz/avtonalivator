import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../strings.dart';
import '../../widgets/basic_card.dart';
import 'widgets/counter.dart';

part 'widgets/app_bar.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return CustomScrollView(
      controller: controller,
      slivers: [
        const _StatsAppBar(),
        SliverToBoxAdapter(
          child: Ink(
            decoration: const BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.vertical(top: AppTheme.radius),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              controller: controller,
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
      color: AppTheme.background,
      child: Text('Card'),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
