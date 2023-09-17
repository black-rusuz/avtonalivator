import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../strings.dart';
import '../../widgets/basic_card.dart';
import '../../widgets/sliver_scaffold.dart';
import 'widgets/counter.dart';

part 'widgets/app_bar.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      sliverAppBar: const _StatsAppBar(),
      bodyBuilder: (_, controller) {
        return ListView.separated(
          shrinkWrap: true,
          controller: controller,
          padding: AppTheme.listPadding,
          itemCount: 20,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
        );
      },
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return const BasicCard(
      padding: AppTheme.padding,
      color: AppTheme.background,
      child: Text('Card'),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }
}
